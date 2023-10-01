import 'package:flutter/material.dart';
import 'package:navigation_flutter/views/detail.dart';
import 'package:navigation_flutter/views/home.dart';

void main() {
  runApp(const MyApp());
}
class  MyApp extends StatelessWidget {
  const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
      routes: {
          '/':(context)=>HomeScrenn(),
        '/details':(context)=>DetailPage(),
      }
    );
  }
}
