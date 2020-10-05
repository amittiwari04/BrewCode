import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:myshop/screens/wrapper.dart';
//import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      backgroundColor: Color.fromRGBO(8, 184, 229, 1),
      nextScreen: Wrapper(),
      splash: "assets/tea.gif",
      splashTransition: SplashTransition.fadeTransition,
      centered: true,
    );
  }
}
