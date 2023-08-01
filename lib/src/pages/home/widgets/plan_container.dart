import 'package:flutter/material.dart';
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
    return BoxCard(
        widget: Column(
      children: [
        Text(title),
        (subtitle != null) ? Text(subtitle!) : Container(),
        (subtitle2 != null) ? Text(subtitle2!) : Container(),
        Text(price),
        Button(
          context: context,
          corTexto: Colors.white,
          cor: Colors.purple,
          texto: "Baixar Aplicativo",
          borda: true,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 30),
          height: 1,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.whatshot),
            ),
            Text(
              "Conversas do whatsapp",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.install_desktop),
            ),
            Text(
              "Instagram",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.loupe_outlined),
            ),
            Text(
              "Histórico de Localização",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.whatshot),
            ),
            Text(
              "Áudios do Whatsapp",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.whatshot),
            ),
            Text(
              "Escuta Ambiente",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.whatshot),
            ),
            Text(
              "Sites Acessados",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.whatshot),
            ),
            Text(
              "Fotos e Videos",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.whatshot),
            ),
            Text(
              "SMS",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    ));
  }
}
