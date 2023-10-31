import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../bottomNavigation/bottomNavigator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {

    Future.delayed(Duration(seconds: 4)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigator(),)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextAnimator(
          
              'Newz Feedz ',
              // atRestEffect: WidgetRestingEffects.pulse(effectStrength: 0.6),
              atRestEffect: WidgetRestingEffects.none(),
              style: GoogleFonts.aDLaMDisplay( fontWeight: FontWeight.bold, fontSize: 48,color: Colors.red,

              ),
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                // blur: const Offset(0, 10), scale: 3,
                 delay: Duration(seconds: 1)
                 
              ),
              
              
              
               //  characterDelay: Duration(milliseconds: 250),
                 
              textAlign: TextAlign.center,),
      ),
    );
  }
}