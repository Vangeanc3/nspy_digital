import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/widgets/button.dart';
import 'package:nspy_digital/src/shared/widgets/my_button.dart';
import 'package:nspy_digital/src/pages/register/widgets/my_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nomeController = TextEditingController();
    var numeroController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("NSPY Digital",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 10, vertical: 40),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Icon(
                    Icons.lock,
                    size: 100,
                  ),
                ),
                Text("Adicionar dispositivo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "Você não possui nenhum dispositivo cadastrado, adicione um agora mesmo para começar o monitoramento",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                MyTextField(
                    controller: nomeController,
                    hintText: "Nome do seu parceiro",
                    obscureText: false),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: MyTextField(
                      controller: numeroController,
                      hintText: "Número",
                      obscureText: false,
                      typeNumber: true),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, "/pre_sales");
                        }
                      },
                      child: const Button(
                        corTexto: Colors.white,
                        texto: "Cadastrar",
                        cor: Colors.purple,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
