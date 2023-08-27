import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/pre_sales/widgets/after_loading_widget.dart';

class PreSalesScreen extends StatefulWidget {
  const PreSalesScreen({super.key});

  @override
  State<PreSalesScreen> createState() => _PreSalesScreenState();
}

class _PreSalesScreenState extends State<PreSalesScreen> {
  String titleLoading = "O monitor está iniciando";
  double progress = 0.0;

  void updateProgress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        progress += 1;
        if (progress < 100) {
          updateProgress();
        } else {
          titleLoading = "O monitor foi iniciado com sucesso";
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ESPIÃO PARA CELULAR",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            children: [
              Text(
                titleLoading,
                style: const TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LinearProgressIndicator(
                    value: progress / 100,
                    minHeight: 50,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple,
                    backgroundColor: Colors.purple[200]),
              ),
              Text(
                "%${progress.toInt()}",
                style: const TextStyle(fontSize: 20),
              ),
              (progress.toInt() == 100)
                  ? const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: AfterLoadingWidget(),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
