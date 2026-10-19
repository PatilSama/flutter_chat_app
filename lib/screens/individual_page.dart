import 'package:chatapp/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatModel;

  const IndividualPage({super.key, required this.chatModel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 24),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? "assets/groups_icon.svg"
                      : "assets/person_icon.svg",
                  color: Colors.white,
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
        title: Column(
          children: [
            Text(
              widget.chatModel.name,
              style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
            ),
            Text("Last seen today at 12:10", style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
