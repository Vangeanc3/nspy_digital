import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/sales_page/widgets/plan_container.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar:  AppBar(title: const Text("ESPIÃO PARA CELULAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900)), centerTitle: true, backgroundColor: Colors.purple,),
      body:  SingleChildScrollView(
        child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                child: Column(
                  children: const [
                    Text("ESCOLHA SEU PLANO",
                        style:
                            TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                          "Aceitamos cartão de crédito e PIX como meios de pagamento!",
                          textAlign: TextAlign.center),
                    ),
                    PlanContainer(
                        title: "SPY - SEMESTRAL",
                        subtitle: "R\$0,55 POR DIA",
                        price: "R\$99,90"),
                  ],
                ),
              ),
      )
    );
  }
}