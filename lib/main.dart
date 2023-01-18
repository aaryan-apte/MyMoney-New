import 'package:flutter/material.dart';
import 'package:my_money/pages/homepage/expensedaytabs.dart';
import 'package:my_money/pages/homepage/expensetoptabs.dart';
import 'package:my_money/pages/homepage/home_page.dart';
import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      //'expense': (context) => ExpenseTopTabs(0),
      //'expenseday': (context) => ExpenseDayTabs(),
      'home1': (context) => Home1(),
      'home_page': (context) => MyHomePage(),
      'input': (context) => Input(),
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}