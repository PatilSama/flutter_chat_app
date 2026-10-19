import 'package:chatapp/core/constant/color_const.dart';
import 'package:chatapp/custom_ui/custom_card.dart';
import 'package:chatapp/model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Samadhan',
      icon: 'person_icon.svg',
      isGroup: false,
      time: '1:00',
      currentMessage: 'Hi Samadhan',
    ),
    ChatModel(
      name: 'prime',
      icon: 'groups_icon.svg',
      isGroup: true,
      time: '10:00',
      currentMessage: 'Hi prime',
    ),
    ChatModel(
      name: 'Mayuri',
      icon: 'person_icon.svg',
      isGroup: false,
      time: '11:00',
      currentMessage: 'Hi Mayuri',
    ),
    ChatModel(
      name: 'Yash',
      icon: 'person_icon.svg',
      isGroup: false,
      time: '12:00',
      currentMessage: 'Hi Yash',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: ColorConst.accentColor,
        shape: const CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
