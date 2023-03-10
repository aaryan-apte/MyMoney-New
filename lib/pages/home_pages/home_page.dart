// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_money/pages/home_pages/expensetoptabs.dart';
import 'package:my_money/pages/home_pages/income_page.dart';

import 'incometoptabs.dart';
// import 'package:my_money/pages/home_pages/incometoptabs.dart';

// import '../home_pages/expensetoptabs.dart';
// import '../home_pages/incometoptabs.dart';
/*import 'package:untitled1/home_pages/expensetoptabs.dart';
import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';
import 'package:my_money/pages/homepage/expensetoptabs.dart';*/

Color? PrimaryColor = Colors.blue[900];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: PrimaryColor,
            title: Center(
              child: Text(
                "MyMoney",
                style: TextStyle(
                  fontSize: 28.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
            // was initially bottom
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 6.0,
              onTap: (index) {
                setState(
                  () {
                    switch (index) {
                      case 0:
                        // PrimaryColor = Colors.blue[900]!;
                        // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => IncomeTopTabs(colorVal)));
                        break;
                      case 1:
                        // PrimaryColor = Colors.blue[900]!;
                        break;
                      //case 2:
                      //PrimaryColor=Color(0xffe91e63);
                      //break;
                      default:
                    }
                  },
                );
              },
              tabs: const [
                Tab(
                  child: Text(
                    'EXPENSE',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                // SizedBox(
                //   width: 17.0,
                // ),
                Tab(
                  // child: TextButton(
                  //   child: Text(
                  //     'INCOME',
                  //     style: TextStyle(color: Colors.white, fontSize: 18.0),
                  //   ),
                  //   onPressed: () {},
                  // ),
                  child: Text(
                    'INCOME',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                ExpenseTopTabs(0xff3f51b5),
                IncomePage(0xff3f51b5),
                //IncomeTopTabs(0xff3f51b5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
