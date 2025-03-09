import 'package:flutter/material.dart';
import 'package:flutter_sample/components/notification/screens/notification_list_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(18),
      itemCount: 8,
      itemBuilder: (context, index) {
        return NotificationListTile();
      },
    )); 
  }
}
