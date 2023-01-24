import 'package:flutter/material.dart';
import 'package:my_money/nav_pages/budgets/budget_category_page.dart';
import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';
import 'package:my_money/nav_pages/goals/enter_goal_page.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  final List _goals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(
            child: Text("Goals",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
        body: Container(
            color: Colors.lightGreen,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                          bottomLeft: Radius.circular(60),
                        )),
                    child: Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              onPressed: () =>
                                  {Navigator.pushNamed(context, 'goalentry')},
                              child: Row(
                                children: [
                                  Image.asset(
                                      'assets/goals_icon/targetgoal.png'),
                                  Text('   + CREATE GOAL',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic))
                                ],
                              ))),
                    ),
                  ),
                ),
                /* ListView.builder(
                itemCount: _goals.length,
              itemBuilder: (context ,index){

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height:50,
                      decoration: const BoxDecoration(
                      color: Colors.white,
                   ),
                   child: _goals[index],
                  ),
                );
              },*/
              ],
            )));
  }
}
