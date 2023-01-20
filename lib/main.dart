import 'package:flutter/material.dart';
import 'package:untitled1/enter_amount_page.dart';
import 'package:untitled1/nav_pages/main_page.dart';
import 'package:untitled1/select_category/expense_category.dart';
import 'package:untitled1/select_category/income_category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: {
        //'expense': (context) => ExpenseTopTabs(0),
        'amount': (context) => EnterAmount(),

      },
    );
  }
}
