import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.crop_rotate)),],
      ),
    );
  }
}
