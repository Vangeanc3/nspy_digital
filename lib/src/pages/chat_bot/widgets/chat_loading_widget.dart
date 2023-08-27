import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';

class ChatLoadingWidget extends StatelessWidget {
  const ChatLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BoxCard(
        widget: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 40),
            child: const SpinKitThreeBounce(
              color: Colors.black,
              size: 15,
            )));
  }
}
