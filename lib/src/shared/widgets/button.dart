import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String texto;
  final Color? cor;
  final Widget? icon;
  final Color corTexto;
  final bool borda;
  final LinearGradient? gradient;
  final BuildContext context;

  const Button({
    super.key,
    required this.texto,
    this.cor,
    this.gradient,
    this.icon,
    required this.corTexto,
    this.borda = false,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
          border: (borda) ? Border.all(width: 1, color: Colors.white) : null,
          boxShadow: kElevationToShadow[3],
          borderRadius: BorderRadius.circular(100),
          color: cor,
          gradient: gradient),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: icon,
          ),
          Text(texto, style: TextStyle(color: corTexto)),
        ],
      ),
    );
  }
}
