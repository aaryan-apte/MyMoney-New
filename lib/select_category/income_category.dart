
import 'package:flutter/material.dart';
import 'package:untitled1/enter_amount_page.dart';

class IncomeCategory extends StatefulWidget
{
  @override
  _IncomeCategoryState createState() => _IncomeCategoryState();
}

class _IncomeCategoryState extends State<IncomeCategory>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: Color(0xffe91e63),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),)
                ),
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(child: Text(
                            "Pick up a Category",
                            style: TextStyle(color: Color(0xffe91e63), fontSize: 20)))),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/income_icons/money-bag.png',
                                  'Deposits')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/income_icons/save-money.png',
                                  'Salary')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/income_icons/piggy-bank.png',
                                  'Savings')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/add.png',
                                  'Add New ')
                          ),
                        ),
                      ],
                    ),
                    /*Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/add.png',
                                  'Add new')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/add.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/add.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/appliances.png',
                                  'Shopping')
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/children.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/bag.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/home.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/destination.png',
                                  'Shopping')
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [

                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/golf-player.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/sparkle.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/heartbeat.png',
                                  'Shopping')
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconGenerator(
                                  'assets/expense_icons/add.png',
                                  'Shopping')
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }


  Container IconFunction(Icon icn, String txt) {
    return Container(
      child: Column(
        children: [
          IconButton(onPressed: () {},
              icon: icn,
              iconSize: 50,
              color: Color(0xffe91e63)),
          Text(txt),
        ],
      ),
    );
  }

  TextButton IconGenerator(String img, String txt) {
    return TextButton(onPressed: () {},
        child: Column(
          children: [
            Image.asset(img),
            Text(txt, style: TextStyle(color: Colors.black, fontSize: 11,fontWeight: FontWeight.w500))
          ],
        )
    );
  }
}