import 'package:flutter/material.dart';
import 'package:my_money/pages/homepage/incometoptabs.dart';
import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';
import 'package:my_money/pages/homepage/expensetoptabs.dart';

Color PrimaryColor = Color(0xff109618);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 5, child: Scaffold(appBar: AppBar(
      backgroundColor: PrimaryColor,
      title:Padding(
        padding:EdgeInsets.only(top:8.0),
      ),
      bottom: TabBar(
        isScrollable: true,
        indicatorColor: Colors.white,
        indicatorWeight: 6.0,
        onTap: (index){
          setState(() {
          switch(index){
            case 0:
              PrimaryColor=Color(0xffe91e63);
              break;
              case 1:
                PrimaryColor=Color(0xff3f51b5);
                break;
              //case 2:
                //PrimaryColor=Color(0xffe91e63);
                //break;    
            default:    
          }
          });
        }, tabs:<Widget> [
          Tab(
            child: Container(
              child: Text(
                'EXPENSE',
                 style: TextStyle(color:Colors.white, fontSize: 18.0),
                ),
             ),
          ),
          Tab(
            child: Container(
              child: Text(
                'INCOME',
                 style: TextStyle(color:Colors.white, fontSize: 18.0),
                ),
             ),
          )
        ],
      ),
    ),
    body: TabBarView(
      children:<Widget> [
      
        ExpenseTopTabs(0xffe91e63),
        IncomeTopTabs(0xff3f51b5)
      ],
    )
    ),);
  }
}