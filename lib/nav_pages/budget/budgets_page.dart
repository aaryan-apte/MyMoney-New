import 'package:flutter/material.dart';
// import 'package:my_money/nav_pages/budgets/budget_category_page.dart';
// import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  // final List _limits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Budgets",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          children: [
            const SizedBox(
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
                  ),
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () => {
                        //BudgetCategory()
                        Navigator.pushNamed(context, 'budgetcategory')
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/budget_icons/budgeting2.png',
                          ),
                          const Text(
                            '          + CREATE BUDGET',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
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
        ),
      ),
    );
  }
}


