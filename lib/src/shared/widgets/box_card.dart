import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final Widget widget;
  final Color? color;
  final bool borda;
  final Color? borderColor;
  final double radius;
  const BoxCard({
    super.key,
    required this.widget,
    this.color,
    this.borda = false,
    this.borderColor = Colors.black,
    this.radius = 10,
  });

  Color? escolheCor(BuildContext context) {
    if (color != null) {
      return color;
    }
    return Theme.of(context).cardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: (borda) ? Border.all(width: 1, color: borderColor!) : null,
          borderRadius: BorderRadius.circular(radius),
          color: escolheCor(context)),
      child: widget,
    );
  }
}
