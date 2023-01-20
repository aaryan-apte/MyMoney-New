import 'package:flutter/material.dart';
import 'package:untitled1/home_pages/expensetoptabs.dart';
import 'package:untitled1/home_pages/incometoptabs.dart';
/*import 'package:untitled1/home_pages/expensetoptabs.dart';
import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';
import 'package:my_money/pages/homepage/expensetoptabs.dart';*/

Color PrimaryColor = Color(0xff109618);

class MyHomePage extends StatefulWidget
{
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: PrimaryColor,
              title:Padding(
                  padding:EdgeInsets.only(top:8.0),
                  child:Center(child: Text("You have saved 1000 up till now!", style: TextStyle(fontSize: 10)))
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
                },
                tabs:<Widget> [
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
            body: SafeArea(
              child: TabBarView(
                children:<Widget> [

                 ExpenseTopTabs(0xffe91e63),
                  IncomeTopTabs(0xff3f51b5)
                ],
              ),
            )
        ),
      ),

    );
  }
}