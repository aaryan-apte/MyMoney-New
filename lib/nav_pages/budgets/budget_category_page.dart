import 'package:flutter/material.dart';
import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';

class BudgetCategory extends StatefulWidget {
  @override
  _BudgetCategoryState createState() => _BudgetCategoryState();
}

class _BudgetCategoryState extends State<BudgetCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Select the category"),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Column(children: [
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
            height: 670,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )),
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                        child: Text("Pick up a Category",
                            style: TextStyle(
                                color: Color(0xffe91e63), fontSize: 20)))),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/online-shopping.png',
                              'Shopping')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/grocery-cart.png',
                              'Grocery')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/dining.png', 'Dining')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/bill.png', 'Bills')),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/biofuel.png', 'Fuel')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/headphone.png', 'Gadgets')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/profits.png',
                              'Investment')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/appliances.png',
                              'Household')),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/children.png', 'Kids')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/bag.png', 'Office')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/home.png', 'House Rent')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/destination.png',
                              'Travel')),
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
                              'Leisure')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/sparkle.png', 'Grooming')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/heartbeat.png', 'Health')),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconGenerator(
                              'assets/expense_icons/add.png', 'Add New')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
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
              color: Color(0xffe91e63)),
          Text(txt),
        ],
      ),
    );
  }

  TextButton IconGenerator(String img, String txt) {
    return TextButton(
        onPressed: () {
          // EnterBudgetAmount()
          Navigator.pushNamed(context, 'budgetlimit');
        },
        child: Column(
          children: [
            Image.asset(img),
            Text(txt,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500))
          ],
        ));
  }
}
