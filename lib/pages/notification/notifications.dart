import 'package:flutter/material.dart';
import 'package:zoho_clone/pages/home/components/ListCard.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreentate createState() => _NotificationScreentate();
}

class _NotificationScreentate extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListCard(),
            SizedBox(
              height: 10,
            ),
            ListCard(),
            SizedBox(
              height: 10,
            ),
            ListCard(),
            SizedBox(
              height: 10,
            ),
            ListCard(),
            SizedBox(
              height: 10,
            ),
            ListCard(),
            SizedBox(
              height: 10,
            ),
            ListCard(),
            SizedBox(
              height: 10,
            ),
            ListCard(),
            SizedBox(
              height: 10,
            ),
            ListCard(),
          ],
        ),
      ),
    );
  }
}
