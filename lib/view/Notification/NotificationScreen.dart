import 'package:flutter/material.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
           Image.asset("assets/images/Icons.png"),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        Center(
          child: Icon(Icons.notifications_off_outlined,size: 100,color: Colors.white,),
        )

      ]),
    );
  }
}