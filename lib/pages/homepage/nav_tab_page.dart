import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/pages//home_pages/home_page.dart';
import 'package:my_money/nav_pages/records/records_page.dart';
import 'package:my_money/nav_pages/budget/budgets_page.dart';
import 'package:my_money/nav_pages/goals/goals_page.dart';
import 'package:my_money/pages/signup/logout.dart';

Color PrimaryColor = Color(0xff3f51b5);

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
    LogOut(),
  ];

  int currindex = 0;
  void onTap(int index) {
    setState(() {
      currindex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
            BottomNavigationBarItem(label: ("Logout"), icon: Icon(Icons.power_settings_new_rounded))
          ],
        ),
      ),
    );
  }
}




// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:my_money/pages/homepage/incometoptabs.dart';
// import 'package:my_money/pages/login.dart';
// import 'package:my_money/pages/signup/home1.dart';
// import 'package:my_money/pages/signup/register.dart';
// import 'package:my_money/pages/signup/input.dart';
// import 'package:my_money/pages/homepage/expensetoptabs.dart';
//
// Color PrimaryColor = Color(0xff109618);
//
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: PrimaryColor,
//             title: const Padding(
//               padding: EdgeInsets.only(top: 8.0),
//             ),
//             bottom: TabBar(
//               //isScrollable: true,
//               indicatorColor: Colors.white,
//               indicatorWeight: 6.0,
//               onTap: (index) {
//                 setState(() {
//                   switch (index) {
//                     case 0:
//                       PrimaryColor = Color(0xffe91e63);
//                       break;
//                     case 1:
//                       PrimaryColor = Color(0xff3f51b5);
//                       break;
//                     //case 2:
//                     //PrimaryColor=Color(0xffe91e63);
//                     //break;
//                     default:
//                   }
//                 },);
//               },
//               tabs: <Widget>[
//                 Tab(
//                   child: Container(
//                     child: Text(
//                       'EXPENSE',
//                       style: TextStyle(color: Colors.white, fontSize: 18.0),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     child: Text(
//                       'INCOME',
//                       style: TextStyle(color: Colors.white, fontSize: 18.0),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               ExpenseTopTabs(0xffe91e63),
//               IncomeTopTabs(0xff3f51b5)
//             ],
//           ),),
//
//     );
//   }
// }
