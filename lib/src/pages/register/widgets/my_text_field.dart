import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nspy_digital/src/shared/utils/validate_value.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool typeNumber;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.typeNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    RegExp phoneNumberRegExp = RegExp(r'^\(\d{2}\) \d{4,5}-\d{4}$');
    var maskFormatter = MaskTextInputFormatter(
        mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        validator: (value) {
          if (validateValue(value)) {
            return "Insira algum texto";
          } else if (typeNumber) {
            if (!phoneNumberRegExp.hasMatch(value!)) {
              return 'Número de telefone inválido';
            } else {
              return null;
            }
          } else {
            return null;
          }
        },
        controller: controller,
        keyboardType: (typeNumber) ? TextInputType.number : TextInputType.text,
        inputFormatters: (typeNumber) ? [maskFormatter] : [],
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
