import 'package:flutter/material.dart';
import 'package:my_money/pages/homepage/expensedaytabs.dart';
import 'package:my_money/pages/homepage/home_page.dart';
import 'package:my_money/pages/home_pages/incometoptabs.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double money = 50.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Color(0xffe91e63),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                )),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
                color: Color(0xffe91e63),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )),
          ),
        ]),
      ),
    );
  }
}
