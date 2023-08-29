import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/widgets/my_button.dart';

class AfterLoadingWidget extends StatelessWidget {
  const AfterLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Atenção, 173 mensagens suspeitas, 34 ligações e 25 fotos foram encontrados!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 4, color: Colors.purple),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInfoContainer("173", "Mensagens", true),
              _buildInfoContainer("34", "Chamadas", true),
              _buildInfoContainer("25", "Fotos", false),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Clique no botão abaixo para ver tudo!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {},
          child: const MyButton(
            text: "Iniciar",
            onTap: null,
          ),
        )
      ],
    );
  }

  Widget _buildInfoContainer(String count, String label, bool borderRight) {
    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: (borderRight)
              ? const Border(
                  right: BorderSide(
                  color: Colors.purple,
                  width: 1,
                ))
              : null),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              count,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
