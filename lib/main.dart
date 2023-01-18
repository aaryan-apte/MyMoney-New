import 'package:flutter/material.dart';
import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'home': (context) => Home1(),
      'input': (context) => Input(),
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}