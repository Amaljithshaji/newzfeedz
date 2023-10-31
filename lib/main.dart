import 'package:flutter/material.dart';
import 'package:newzfeedz/controller/Controller.dart';
import 'package:provider/provider.dart';

import 'view/bottomNavigation/bottomNavigator.dart';
import 'view/splash/splash.dart';
//import 'view/Home/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
    ],
      child: const MaterialApp( 
        home:  Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );}
}