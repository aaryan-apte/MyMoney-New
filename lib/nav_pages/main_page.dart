import 'package:flutter/material.dart';
import 'package:my_money/pages/home_pages/home_page.dart';
import 'package:my_money/nav_pages/records_page.dart';
import 'package:my_money/nav_pages/budgets_page.dart';
import 'package:my_money/nav_pages/goals_page.dart';
/*import 'package:my_money/pages/homepage/incometoptabs.dart';
import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';
import 'package:my_money/pages/homepage/expensetoptabs.dart';*/

Color PrimaryColor = Color(0xff109618);

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  List pages = [
    MyHomePage(),
    RecordPage(),
    BudgetPage(),
    GoalsPage(),
  ];

  int currindex = 0;
  void onTap(int index) {
    setState(() {
      currindex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currindex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        //selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currindex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        //showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: ("Records"), icon: Icon(Icons.newspaper)),
          BottomNavigationBarItem(
              label: ("Budgets"), icon: Icon(Icons.calculate)),
          BottomNavigationBarItem(label: ("Goals"), icon: Icon(Icons.games)),
        ],
      ),
    );
  }
}
