import 'package:flutter/material.dart';
import 'package:nspy_digital/src/database/nspy_dao.dart';

class ChatButtonWidget extends StatelessWidget {
  const ChatButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        NSPYDao().setarLogado();
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Proseguir", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
    ;
  }
}
