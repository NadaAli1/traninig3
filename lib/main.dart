import 'package:flutter/material.dart';
import 'package:traninig3/flutter_dart_screen.dart';
import 'package:traninig3/login.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
