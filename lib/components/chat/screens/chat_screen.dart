import 'package:flutter/material.dart';
import 'package:flutter_sample/components/chat/screens/chat_list_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(18),
        itemCount: 8,
        itemBuilder: (context, index) {
          return ChatListTile();
        },
      ),
    );
  }
}
