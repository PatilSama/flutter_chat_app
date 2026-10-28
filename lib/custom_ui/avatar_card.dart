import 'package:chatapp/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarCard extends StatelessWidget {
  final ChatModel? contests;

  const AvatarCard({super.key, this.contests});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey.shade200,
              child: SvgPicture.asset(
                "assets/person_icon.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                width: 30,
                height: 30,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                radius: 9,
                child: Icon(Icons.clear, color: Colors.white, size: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 2),
        Text(contests?.name ?? '', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
