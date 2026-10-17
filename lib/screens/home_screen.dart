import 'package:chatapp/pages/chat_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (kDebugMode) {
                print(value);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 'New Group', child: Text('New Group')),
                PopupMenuItem(
                  value: 'New Broadcast',
                  child: Text('New Broadcast'),
                ),
                PopupMenuItem(
                  value: 'WhatsApp Web',
                  child: Text('WhatsApp Web'),
                ),
                PopupMenuItem(
                  value: 'Starred Message',
                  child: Text('Starred Message'),
                ),
                PopupMenuItem(value: 'Settings', child: Text('Settings')),
              ];
            },
          ),
        ],
        bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
          controller: _controller,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [Text('CAMERA'), ChatPage(), Text('STATUS'), Text('CALLS')],
      ),
    );
  }
}
