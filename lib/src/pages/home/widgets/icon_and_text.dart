import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final Widget icon;
  final Text text;
  final bool center;
  const IconAndText(
      {super.key, required this.icon, required this.text, this.center = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: icon,
          ),
          Expanded(child: text),
        ],
      ),
    );
  }
}
