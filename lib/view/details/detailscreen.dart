import 'package:flutter/material.dart';

import '../bottomNavigation/bottomNavigator.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigator(),));
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
            title: Text('Details'),
            centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.white,
              )),
              IconButton(onPressed: (){
              
              }, icon: Icon(Icons.share_outlined,color: Colors.white,))
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
    );
  }
}
