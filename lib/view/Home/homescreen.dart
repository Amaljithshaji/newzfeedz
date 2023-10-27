import 'package:flutter/material.dart';
import 'package:newzfeedz/view/Notification/NotificationScreen.dart';
import 'package:newzfeedz/view/Search/Search.dart';


import 'widgets/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
              }, child: Image.asset("assets/images/Icons (1).png")),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotifScreen(),));
            }, child: Image.asset("assets/images/Icons.png")),
            SizedBox(width: 10,),
            InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/Vector.png",
                  width: 25,
                  height: 25,
                )),
                SizedBox(width: 16,)
          ],
          bottom: TabBar(
            physics: AlwaysScrollableScrollPhysics(),
            isScrollable: true,
            indicatorColor: Colors.red,
            labelStyle: TextStyle(fontSize: 18),
            tabs: [
            Tab(text: 'General',),
            Tab(text: 'Tech',),
            Tab(text: 'Science',),
            Tab(text: 'Sports',),
            Tab(text: 'Health',),
            Tab(text: 'Business',),
            Tab(text: 'Entertainment',),
          ]),
        ),
        body: TabBarView(children: [
         Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(),
          ),
         
          Container(
          width: double.infinity,
          height: 400,
          color: Colors.black,
          child: Category(),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(),
         ),
          Container(
          width: double.infinity,
          height: 500,
          color: Colors.black,
          child: Category(),
         ),
         
        ])
      ),
    );
  }
}
