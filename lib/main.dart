import 'package:flutter/material.dart';

import 'view/bottomNavigation/bottomNavigator.dart';
//import 'view/Home/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      home:  BottomNavigator(),
      debugShowCheckedModeBanner: false,
    );}
}