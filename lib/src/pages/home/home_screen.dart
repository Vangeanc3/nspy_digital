import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/home/widgets/functions_container.dart';
import 'package:nspy_digital/src/pages/home/widgets/icon_and_text.dart';
import 'package:nspy_digital/src/pages/home/widgets/video_player_view.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:nspy_digital/src/shared/widgets/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NSPY Digital",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(top: 10, bottom: 25),
                    height: MediaQuery.of(context).size.height * 0.8,
                    // width: double.infinity,
                    child: const VideoPlayerView(),
                  ),
                  Container(
                    height: 1,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: IconAndText(
                        icon: Icon(Icons.check_box_outlined,
                            color: Colors.green[400]),
                        text: const Text(
                          "Monitore mensagens do Whatsapp",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  IconAndText(
                      icon: Icon(Icons.check_box_outlined,
                          color: Colors.green[400]),
                      text: const Text(
                        "Mensagens do Instagram",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                  IconAndText(
                      icon: Icon(Icons.check_box_outlined,
                          color: Colors.green[400]),
                      text: const Text(
                        "Escute o ambiente",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                  IconAndText(
                      icon: Icon(Icons.check_box_outlined,
                          color: Colors.green[400]),
                      text: const Text(
                        "Localização em tempo real",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () => navigateRegister(context),
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
                      onTap: () => navigateRegister(context),
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
                            color: Colors.white,
                            widget: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "100% Invisivel",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: BoxCard(
                            color: Colors.white,
                            widget: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.headset_mic_outlined,
                                    size: 50,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Suporte 12/7",
                                  style: TextStyle(color: Colors.black),
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
                        onTap: () => navigateRegister(context),
                        child: const Button(
                          corTexto: Colors.black,
                          cor: Colors.white,
                          texto: "Iniciar Monitoramento",
                          borda: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateRegister(BuildContext context) {
    Navigator.pushNamed(context, "/register");
  }
}
