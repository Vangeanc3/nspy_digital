import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/home/widgets/functions_container.dart';
import 'package:nspy_digital/src/pages/home/widgets/icon_and_text.dart';
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text("ESPIÃO PARA CELULAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w900)),
                  ),
                  BoxCard(
                      radius: 100,
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: VideoPlayer(_controller),
                  ),
                  Container(
                    height: 1,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: IconAndText(
                        icon:
                            Icon(Icons.check_box_outlined, color: Colors.green),
                        text: Text(
                          "Monitore mensagens do Whatsapp",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  const IconAndText(
                      icon: Icon(Icons.check_box_outlined, color: Colors.green),
                      text: Text(
                        "Mensagens do Instagram",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  const IconAndText(
                      icon: Icon(Icons.check_box_outlined, color: Colors.green),
                      text: Text(
                        "Escute o ambiente",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  const IconAndText(
                      icon: Icon(Icons.check_box_outlined, color: Colors.green),
                      text: Text(
                        "Localização em tempo real",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {},
                        child: const Button(
                          corTexto: Colors.white,
                          cor: Colors.purple,
                          texto: "Iniciar Monitoramento",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text("FUNÇÕES DO APLICATIVO",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w900)),
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.mic_rounded, color: Colors.red, size: 35),
                    title: "SOM AMBIENTE",
                    description:
                        "Escute  e Grave conversas sendo feitas no ambiente em tempo real, de forma silenciosa e sem rastros.",
                  ),
                  const FunctionContainer(
                    icon: Image(
                        image: AssetImage("assets/images/instagram.png"),
                        height: 35),
                    title: "INSTAGRAM",
                    description:
                        "Visualize todas as mensagens de texto, áudio e vídeos do instagram.",
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.phone, color: Colors.blue, size: 35),
                    title: "CHAMADAS",
                    description:
                        "Histórico cronológico de chamadas, efetuadas, recebidas e rejeitadas.",
                  ),
                  const FunctionContainer(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 35,
                    ),
                    title: "LOCALIZAÇÃO",
                    description:
                        "Receba atualizações a cada 10 minutos da localização exata do seu parceiro(a).",
                  ),
                  const FunctionContainer(
                    icon: Icon(Icons.photo_library,
                        color: Colors.green, size: 35),
                    title: "FOTOS E VÍDEOS",
                    description:
                        "Tenha acesso a galeria completa do celular monitorado!!",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {},
                      child: const Button(
                        corTexto: Colors.white,
                        cor: Colors.purple,
                        texto: "Iniciar Monitoramento",
                        borda: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              color: Colors.purple,
              child: Column(
                children: [
                  const Text(
                      "A Nspy está no mercado a mais de 12 anos, ajudando pessoas a saberem a verdade.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500)),
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Text(
                        "Nossos softwares são altamente testados e com tecnologia de ponta.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: BoxCard(
                            borderColor: Colors.white,
                            borda: true,
                            color: Colors.purple,
                            widget: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "100% Invisivel",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: BoxCard(
                            borderColor: Colors.white,
                            borda: true,
                            color: Colors.purple,
                            widget: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.headset_mic_outlined,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Suporte 12/7",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {},
                        child: const Button(
                          corTexto: Colors.white,
                          cor: Colors.purple,
                          texto: "Iniciar Monitoramento",
                          borda: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                children: const [
                  Text("ESCOLHA SEU PLANO",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                        "Aceitamos cartão de crédito e PIX como meios de pagamento!",
                        textAlign: TextAlign.center),
                  ),
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
