import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/chat_widget.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/input_message.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/utils/aumatic_message.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  bool showInput = false;
  late ScrollController _listScrollController;

  @override
  void initState()  {
    _listScrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       await automaticMessage(context).then((value) {
        setState(() {
          showInput = value;
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MensagensRepository>(context);

    return Scaffold(
       appBar:  AppBar(title: const Text("ESPIÃO PARA CELULAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900)), centerTitle: true, backgroundColor: Colors.purple,),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 8, 0),
                  child: ListView.builder(
                    //  controller: _listScrollController,
                    itemCount: messageProvider.getList.length,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                          received: messageProvider.messages[index]["received"],
                          text: messageProvider.getList[index]["text"],
                          loading: messageProvider.getList[index]["loading"],
                          shouldAnimate: messageProvider.getList.length - 1 == index,);
                    },
                  ),
                ),
              ),
              (showInput) ? 
               InputMessage(callBack: (data) {
                showInput = data;
               },).animate().fade(begin: 0, end: 1, duration: 500.milliseconds)
              : Container()
            ],
          ),
        ),
      ),
    );
  }
}
