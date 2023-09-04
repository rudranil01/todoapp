import 'package:flutter/material.dart';
import 'package:todoapp/home.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo app',
//
//       home: Home(),
//     );
//   }
// }
void main() {
  runApp(MaterialApp(


    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      //'login': (context) => Mylogin(),
      'home': (context) => Home(),



    },
  ));
}

