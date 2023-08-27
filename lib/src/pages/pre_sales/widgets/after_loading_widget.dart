import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/widgets/button.dart';

class AfterLoadingWidget extends StatelessWidget {
  const AfterLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Atenção, 173 mensagens suspeitas, 34 ligações e 25 fotos",
          textAlign: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoContainer("173", "Mensagens"),
              _buildInfoContainer("34", "Chamadas"),
              _buildInfoContainer("25", "Fotos"),
            ],
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {},
          child: const Button(
            texto: "Iniciar",
            corTexto: Colors.white,
            cor: Colors.purple,
          ),
        )
      ],
    );
  }

  Widget _buildInfoContainer(String count, String label) {
    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(
        width: 1,
      ))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              count,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
