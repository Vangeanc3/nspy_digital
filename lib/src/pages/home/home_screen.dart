import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:nspy_digital/src/shared/widgets/button.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/app/Logo_Revial.mp4")
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playVideo(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  const Text("Espião para celular"),
                  BoxCard(
                      widget: Row(
                    children: const [
                      Icon(Icons.account_box_rounded),
                      Text("100% invisivel e seguro")
                    ],
                  )),
                  Container(
                    child: VideoPlayer(_controller),
                  ),
                  Container(
                    height: 1,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check),
                      Text("Monitore mensagens do Whatsapp")
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check),
                      Text("Mensagens do Instagram")
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check),
                      Text("Escute o ambiente")
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check),
                      Text("Localização em tempo real")
                    ],
                  ),
                  Button(
                    context: context,
                    corTexto: Colors.white,
                    cor: Colors.purple,
                    texto: "Iniciar Monitoramento",
                    borda: true,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void _playVideo(BuildContext context) async {
    // INICIANDO O VIDEO
    _controller.play();

    // ADD O DELAY PARA INICIAR O VIDEO COMPLETO
    await Future.delayed(const Duration(seconds: 4));

    //  NAVEGANDO PARA A TELA INICIAL
    Navigator.pushReplacementNamed(context, "/welcome");
  }
}
