

import 'package:flutter/material.dart';
//import 'package:hidable/hidable.dart';
import 'package:newzfeedz/view/Home/homeScreen.dart';
import 'package:newzfeedz/view/Search/Search.dart';
//import 'package:newzfeedz/view/details/new.dart';
//import 'package:newzfeedz/view/profile/profile.dart';
//import 'package:newzfeedz/view/saved/saved.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> with TickerProviderStateMixin {
  int index = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
   // Share(),
   // ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    
    // var anim = AnimationController(
    //   vsync: this,
    //   value: 1,
    //   duration: const Duration(milliseconds: 500),
    //);
    return Scaffold(
      extendBody: true,
      body: _pages[index],
      bottomNavigationBar:Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BottomNavigationBar(
              onTap: (i) => setState(() => index = i),
              currentIndex: index,
               backgroundColor: Colors.black,
               selectedItemColor: Colors.white ,
               type: BottomNavigationBarType.shifting,
               
               
              items:
             [
              BottomNavigationBarItem( icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,),
              BottomNavigationBarItem( icon: Icon(Icons.explore),label: 'Explore',
              backgroundColor:Colors.black, ),
              
            
              ],),
          ),
        ),
      )
    );
  }
}


    