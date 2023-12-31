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
  void initState() {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("NSPY Digital",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                  child: Consumer<MensagensRepository>(
                    builder: (context, list, child) {
                      return CustomScrollView(
                        slivers: [
                          SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                            return ChatWidget(
                              received: list.getList[index]["received"],
                              text: list.getList[index]["text"],
                              loading: list.getList[index]["loading"],
                              shouldAudio: list.getList[index]["audio"],
                              shouldButton: list.getList[index]["button"],
                              shouldAnimate: list.getList.length - 1 == index,
                            );
                          }, childCount: list.getList.length))
                        ],
                      );
                    },
                  ),
                ),
              ),
              (showInput)
                  ? InputMessage(
                      callBack: (data) {
                        setState(() {
                          showInput = data;
                        });
                      },
                    )
                      .animate()
                      .fade(begin: 0, end: 1, duration: 500.milliseconds)
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
