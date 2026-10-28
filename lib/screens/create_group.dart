import 'package:chatapp/custom_ui/ContactCard.dart';
import 'package:chatapp/custom_ui/avatar_card.dart';
import 'package:chatapp/custom_ui/button_card.dart';
import 'package:chatapp/model/ChatModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel?> contact = [
    ChatModel(name: "Dev Stack", status: "A Full Stack Developer"),
    ChatModel(name: "Balram", status: "Flutter Developer"),
    ChatModel(name: "Saket", status: "Web Developer"),
    ChatModel(name: "Sama", status: "App Dev"),
  ];
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text('Add participants', style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 26)),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contact.length+1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(height: groups.isNotEmpty ? 90 : 10);
              }
              return InkWell(
                onTap: () {
                  if (contact[index-1]?.select == false) {
                    setState(() {
                      contact[index-1]?.select = true;
                      groups.add(contact[index-1]!);
                    });
                  } else {
                    setState(() {
                      contact[index-1]?.select = false;
                      groups.remove(contact[index-1]);
                    });
                  }
                },
                child: ContactCard(contacts: contact[index-1]),
              );
            },
          ),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        itemExtent: 60,
                        itemCount: contact.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (contact[index]?.select == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  groups.remove(contact[index]);
                                  contact[index]?.select = false;
                                });
                              },
                              child: AvatarCard(contests: contact[index]),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),

                    Divider(thickness: 1),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
