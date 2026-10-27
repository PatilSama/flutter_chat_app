import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/ChatModel.dart';

class ButtonCard extends StatelessWidget {
  final IconData? icon;
  final String? name;
  final VoidCallback onTab;

  const ButtonCard({super.key, this.name, this.icon,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Color(0xFF25D366),
          child: Icon(icon,color: Colors.white,size: 26,),
        ),
        title: Text(
          name ?? '',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
