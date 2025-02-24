import 'package:echotrip_planner/controller/location_controller.dart';
import 'package:echotrip_planner/controller/login_controller.dart';
import 'package:echotrip_planner/controller/new_trip_controller.dart';
import 'package:echotrip_planner/controller/registration_controller.dart';

import 'package:echotrip_planner/firebase_options.dart';
import 'package:echotrip_planner/view/bottom_nav_bar/bottom_nav_bar.dart';

import 'package:echotrip_planner/view/intro_screen/intro_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform,
);
runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => LoginScreenController(),),
      ChangeNotifierProvider(create: (context) => LocationController(),),
        ChangeNotifierProvider(create: (context) => RegistrationController(),),
          ChangeNotifierProvider(create: (context) => NewTripController(),),
        


  ],
  child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavScreen();
          }else{
            return IntroScreen();
          }
        },
      )
    );
  }
}