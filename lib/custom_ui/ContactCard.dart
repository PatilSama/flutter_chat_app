import 'package:chatapp/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  final ChatModel? contacts;

  const ContactCard({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey.shade200,
              child: SvgPicture.asset(
                contacts?.icon ?? "assets/person_icon.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                width: 30,
                height: 30,
              ),
            ),
            contacts!.select
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.check, color: Colors.white, size: 18),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contacts?.name ?? '',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(contacts?.status ?? "", style: TextStyle(fontSize: 13)),
    );
  }
}
