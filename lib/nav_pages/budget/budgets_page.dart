// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
  // String budgetCategory = "";

  // Future<void> addBudget() async {
  //   final budgetCategoryAdd = budgetCategory;
  //   // final targetAmountAdd = int.parse(targetAmount.text.trim());
  //   // final savedAmountAdd = int.parse(savedAmount.text.trim());
  //
  //   CollectionReference user1 =
  //   FirebaseFirestore.instance.collection('users');
  //
  //
  //   Map<String, dynamic> map1 = {
  //     "goalName": budgetCategoryAdd,
  //     // "targetAmount": targetAmountAdd,
  //     // "savedAmount": savedAmountAdd
  //   };
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User uid = auth.currentUser!;
  //
  //   try {
  //     await user1
  //         .doc(uid.toString())
  //         .collection('goals')
  //         .add(map1)
  //         .then((value) => print("Success"));
  //     // await user1
  //     //     .doc(uid.toString())
  //     //     .collection('goals')
  //     //     .updateDoc()
  //     //     .then((value) => print("Success"));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text("Budgets",
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500)),
        ),
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


