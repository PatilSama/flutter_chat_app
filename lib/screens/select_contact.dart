import 'package:chatapp/custom_ui/ContactCard.dart';
import 'package:chatapp/custom_ui/button_card.dart';
import 'package:chatapp/model/ChatModel.dart';
import 'package:chatapp/screens/create_group.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel?> contact = [
    ChatModel(name: "Dev Stack", status: "A Full Stack Developer"),
    ChatModel(name: "Balram", status: "Flutter Developer"),
    ChatModel(name: "Saket", status: "Web Developer"),
    ChatModel(name: "Sama", status: "App Dev"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text('256 Contact', style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (kDebugMode) {
                print("Selected Value $value");
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Invite a friend",
                  child: Text('Invite a friend'),
                ),
                PopupMenuItem(value: "Contacts", child: Text("Contacts")),
                PopupMenuItem(value: "Refresh", child: Text("Refresh")),
                PopupMenuItem(value: "Help", child: Text("Help")),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contact.length + 2,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return ButtonCard(
                name: "New Contacts",
                icon: Icons.person_add,
                onTab: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CreateGroup()),
                  // );
                },
              );
            case 1:
              return ButtonCard(
                name: "New Group",
                icon: Icons.group,
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateGroup()),
                  );
                },
              );
            default:
              return ContactCard(contacts: contact[index - 2]);
          }
          // if (index == 0) {
          //   return ButtonCard(name: "New Contacts", icon: Icons.person);
          // } else if (index == 1) {
          //   return ButtonCard(name: "New Group", icon: Icons.group);
          // } else {
          //   return ContactCard(contacts: contact[index]);
          // }
        },
      ),
    );
  }
}
