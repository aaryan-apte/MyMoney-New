// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'budget_enter_limit.dart';
// import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';

class BudgetCategory extends StatefulWidget {
  const BudgetCategory({super.key});

  @override
  _BudgetCategoryState createState() => _BudgetCategoryState();
}

class _BudgetCategoryState extends State<BudgetCategory> {

  late String budgetCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Select the category"),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Column(
          children: [
            /*  Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: Color(0xffe91e63),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),)
                ),
              ),*/
            const SizedBox(height: 20),
            Container(
              height: 648,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        "Pick up a Category",
                        style:
                            TextStyle(color: Color(0xffe91e63), fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/online-shopping.png',
                            'Shopping',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/grocery-cart.png',
                            'Grocery',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/dining.png',
                            'Dining',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/bill.png',
                            'Bills',
                          ),
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
                            'assets/expense_icons/biofuel.png',
                            'Fuel',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/headphone.png',
                            'Gadgets',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/profits.png',
                            'Investment',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/appliances.png',
                            'Household',
                          ),
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
                            'Kids',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/bag.png',
                            'Office',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/home.png',
                            'House Rent',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/destination.png',
                            'Travel',
                          ),
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
                              'Leisure'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                            'assets/expense_icons/sparkle.png',
                            'Grooming',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/heartbeat.png', 'Health'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/add.png', 'Add New'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container IconFunction(Icon icn, String txt) {
    return Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: icn,
            iconSize: 50,
            color: const Color(0xffe91e63),
          ),
          Text(txt),
        ],
      ),
    );
  }

  TextButton IconGenerator(String img, String txt) {
    return TextButton(
      onPressed: () {
        budgetCategory = txt;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EnterBudgetAmount(budgetCategory: budgetCategory)
            )
        );
      },
      child: Column(
        children: [
          Image.asset(img),
          Text(
            txt,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
