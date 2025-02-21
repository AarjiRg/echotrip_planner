import 'package:echotrip_planner/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:echotrip_planner/view/intro_screen/intro_screen.dart';
import 'package:echotrip_planner/view/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:IntroScreen()
    );
  }
}