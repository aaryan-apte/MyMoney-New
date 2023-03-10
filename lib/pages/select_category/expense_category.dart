import 'package:flutter/material.dart';
import 'package:my_money/enter_amount_page.dart';
// import 'package:my_money/enter_amount_page.dart';

class ExpenseCategory extends StatefulWidget {
  @override
  _ExpenseCategoryState createState() => _ExpenseCategoryState();
}

class _ExpenseCategoryState extends State<ExpenseCategory> {

  late String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(children: [
        SizedBox(height: 90.0,),
        // Expanded(
        //   child: Container(
        //     height: 200,
        //     decoration: BoxDecoration(
        //       color: Colors.blue[900],
        //       borderRadius: const BorderRadius.only(
        //         bottomRight: Radius.circular(60),
        //         bottomLeft: Radius.circular(60),
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(height: 20),
        Expanded(
          flex: 3,
          child: Container(
            // height: 580,
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
                        child: Text("Pick up a Category",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w500)))),
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
                              'assets/expense_icons/metro.png', 'Transport')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
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
              color: const Color(0xffe91e63)),
          Text(txt),
        ],
      ),
    );
  }

  TextButton IconGenerator(String img, String txt) {
    return TextButton(
      onPressed: () {
        category = txt;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnterAmount(category: category,))
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
