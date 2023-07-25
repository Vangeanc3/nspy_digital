import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';
import 'package:nspy_digital/src/shared/utils/validate_value.dart';

class InputMessage extends StatelessWidget {
  const InputMessage({super.key});

  @override
  Widget build(BuildContext context) {
    var msgController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColors.temaWhats3),
                child: TextFormField(
                  controller: msgController,
                  validator: (value) {
                    if (validateValue(value)) {
                      return "Insira algum texto";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Sua dúvida",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColors.temaWhats2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      msgController.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
