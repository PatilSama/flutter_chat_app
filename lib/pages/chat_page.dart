import 'package:chatapp/core/constant/color_const.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
    );
  }
}
