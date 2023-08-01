import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/home/widgets/functions_container.dart';
import 'package:nspy_digital/src/pages/home/widgets/plan_container.dart';
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
      _controller.play();
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text("ESPIÃO PARA CELULAR",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  BoxCard(
                      widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.circle, color: Colors.green),
                      ),
                      Text(
                        "100% invisivel e seguro",
                      )
                    ],
                  )),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: VideoPlayer(_controller),
                  ),
                  Container(
                    height: 1,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: const [
                        Icon(Icons.check_box_outlined, color: Colors.green),
                        Text("Monitore mensagens do Whatsapp")
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_box_outlined, color: Colors.green),
                      Text("Mensagens do Instagram")
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_box_outlined, color: Colors.green),
                      Text("Escute o ambiente")
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.check_box_outlined, color: Colors.green),
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
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text("FUNÇÕES DO APLICATIVO",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.mic_rounded, color: Colors.red),
                    title: "SOM AMBIENTE",
                    description:
                        "Escute  e Grave conversas sendo feitas no ambiente em tempo real, de forma silenciosa e sem rastros.",
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.social_distance, color: Colors.red),
                    title: "INSTAGRAM",
                    description:
                        "Visualize todas as mensagens de texto, áudio e vídeos do instagram.",
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.call, color: Colors.red),
                    title: "CHAMADAS",
                    description:
                        "Histórico cronológico de chamadas, efetuadas, recebidas e rejeitadas.",
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.mic_rounded, color: Colors.red),
                    title: "LOCALIZAÇÃO",
                    description:
                        "Receba atualizações a cada 10 minutos da localização exata do seu parceiro(a).",
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.mic_rounded, color: Colors.red),
                    title: "FOTOS E VÍDEOS",
                    description:
                        "Tenha acesso a galeria completa do celular monitorado!!",
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
            ),
            Container(
              color: Colors.purple,
              child: Column(
                children: [
                  const Text(
                      "A Nspy está no mercado a mais de 12 anos, ajudando pessoas a saberem a verdade."),
                  const Text(
                      "Nossos softwares são altamente testados e com tecnologia de ponta."),
                  Row(
                    children: [
                      BoxCard(
                          widget: Column(
                        children: const [
                          Icon(
                            Icons.remove_red_eye,
                          ),
                          Text("100% Invisivel")
                        ],
                      )),
                      BoxCard(
                          widget: Column(
                        children: const [
                          Icon(
                            Icons.remove_red_eye,
                          ),
                          Text("Suporte 12/7")
                        ],
                      )),
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
            ),
            Container(
              child: Column(
                children: const [
                  Text("Escolha seu plano"),
                  Text("Aceitamos cartão de crédito"),
                  PlanContainer(
                      title: "SPY - MENSAL",
                      subtitle: "R\$1,66 POR DIA",
                      subtitle2: "Valor total do plano",
                      price: "R\$49,90"),
                  PlanContainer(
                      title: "SPY - TRIMESTRAL",
                      subtitle: "R\$0,88 POR DIA",
                      price: "R\$79,90"),
                  PlanContainer(
                      title: "SPY - SEMESTRAL",
                      subtitle: "R\$0,55 POR DIA",
                      price: "R\$99,90"),
                  PlanContainer(
                    title: "VITALÍCIO",
                    price: "R\$129,90",
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
