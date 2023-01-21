import 'package:flutter/material.dart';
// import 'package:my_money/pages/homepage/expensedaytabs.dart';
// import 'package:my_money/pages/home_pages/expensetoptabs.dart';
import 'package:my_money/pages/homepage/home_page.dart';
// import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
// import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';
// import 'backend/authentication/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_money/pages/signup/utils.dart';
// import 'package:my_money/pages/signup/utils.dart';

import 'backend/authentication/authenticate2.dart';

// import 'package:my_money/enter_amount_page.dart';
// import 'package:my_money/nav_pages/main_page.dart';
// import 'package:my_money/pages/select_category/expense_category.dart';
// import 'package:my_money/pages/select_category/income_category.dart';
// import 'pages/home_pages/home_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldKey,
      home: Authenticate2(),
      theme: ThemeData(
        fontFamily: 'CrimsonText',
      ),
      routes: {
        //'expense': (context) => ExpenseTopTabs(0),
        //'expenseday': (context) => ExpenseDayTabs(),
        'home1': (context) => Home1(),
        'homepage': (context) => MainPage(),
        'input': (context) => Input(),
        // 'register': (context) => MyRegister(
        //       toggleLoginSignup: myRegister.toggleLoginSignup,
        // ),
        // 'login': (context) => MyLogin(),
      },
    ),
  );
}
