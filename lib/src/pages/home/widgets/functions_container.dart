import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';

class FunctionContainer extends StatelessWidget {
  final Widget icon;
  final String title;
  final String description;
  const FunctionContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: BoxCard(
            borda: true,
            widget: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: icon,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 1.5),
                )
              ],
            )),
      ),
    );
  }
}
