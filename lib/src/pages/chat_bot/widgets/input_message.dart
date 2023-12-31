import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';
import 'package:nspy_digital/src/shared/utils/send_message.dart';
import 'package:nspy_digital/src/shared/utils/send_message_name.dart';
import 'package:nspy_digital/src/shared/utils/validate_value.dart';
import 'package:provider/provider.dart';

class InputMessage extends StatefulWidget {
  final Function(bool)
      callBack; // CALL BACK PARA PASSAR OS DADOS PARA O WIDGET PAI
  const InputMessage({super.key, required this.callBack});

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  bool isButtonDisabled = false;

  @override
  void dispose() {
    super.dispose();
  }

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
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromRGBO(156, 39, 176, 1)),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: msgController,
                  validator: (value) {
                    if (validateValue(value)) {
                      return "Insira algum texto";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  minLines: 1,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Seu nome",
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColors.secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.send_rounded,
                    color: ThemeColors.primaryColor,
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final listLength = Provider.of<MensagensRepository>(
                              context,
                              listen: false)
                          .getList
                          .length;
                      if (listLength < 4) {
                        if (!isButtonDisabled) {
                          isButtonDisabled = true;
                          await sendMessageName(
                              context, msgController.text, widget.callBack);
                          msgController.clear();
                          isButtonDisabled = false;
                        }
                      } else {
                        if (!isButtonDisabled) {
                          isButtonDisabled = true;
                          await sendMessage(msgController.text, context);
                          msgController.clear();
                          widget.callBack(false);
                          isButtonDisabled = false;
                        }
                      }
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
