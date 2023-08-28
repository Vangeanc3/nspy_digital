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
        title: const Text("NSPY Digital",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Image.asset("assets/app/logo.png", height: 100, ),
            Text(
              titleLoading,
              style: const TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: LinearProgressIndicator(
                  value: progress / 100,
                  minHeight: 50,
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
    );
  }
}
