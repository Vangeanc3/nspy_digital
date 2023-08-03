import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/home/widgets/icon_and_text.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:nspy_digital/src/shared/widgets/button.dart';

class PlanContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? subtitle2;
  final String price;

  const PlanContainer({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitle2,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: BoxCard(
            borda: true,
            widget: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w900),
                ),
                (subtitle != null)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          subtitle!,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.purple),
                        ),
                      )
                    : Container(),
                (subtitle2 != null)
                    ? Text(
                        subtitle2!,
                        style: const TextStyle(fontSize: 26),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 25),
                  child: Text(price,
                      style:
                          const TextStyle(fontSize: 30, color: Colors.green)),
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  elevation: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: const Button(
                      corTexto: Colors.white,
                      cor: Colors.purple,
                      texto: "Baixar Aplicativo",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  height: 1,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                const IconAndText(
                    icon: Image(
                        image: AssetImage("assets/images/whatsapp.png"),
                        height: 35),
                    text: Text(
                      "Conversas do whatsapp",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: IconAndText(
                      icon: Image(
                          image: AssetImage("assets/images/instagram.png"),
                          height: 35),
                      text: Text(
                        "Conversas do Instagram",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
                const IconAndText(
                    icon: Icon(Icons.location_on, size: 35),
                    text: Text(
                      "Histórico de localização",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: IconAndText(
                      icon: Icon(Icons.mic, size: 35),
                      text: Text(
                        "Áudios do whatsapp",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
                const IconAndText(
                    icon: Icon(
                      Icons.mic_external_off_outlined,
                      size: 35,
                    ),
                    text: Text(
                      "Escuta ambiente",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: IconAndText(
                      icon: Icon(
                        Icons.wifi_outlined,
                        size: 35,
                      ),
                      text: Text(
                        "Sites acessados",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
                const IconAndText(
                    icon: Icon(Icons.photo_library, size: 35),
                    text: Text(
                      "Fotos e videos",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: IconAndText(
                      icon: Icon(Icons.sms_failed_outlined, size: 35),
                      text: Text(
                        "SMS",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
