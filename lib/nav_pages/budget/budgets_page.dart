// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/nav_pages/budgets/budget_backend/buckets.firestore.dart';
// import 'package:my_money/nav_pages/budgets/budget_category_page.dart';
// import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';
// import 'iconMap.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  // final List _limits = [];
  String budgetCategory = "";

  String? getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser!.email;
    return uid;
  }

  Map<String, String> map1 = {
    'Shopping': 'assets/expense_icons/online-shopping.png',
    'Grocery': 'assets/expense_icons/grocery-cart.png',
    'Dining': 'assets/expense_icons/dining.png',
    'Bills': 'assets/expense_icons/bill.png',
    'Fuel': 'assets/expense_icons/biofuel.png',
    'Gadgets': 'assets/expense_icons/headphone.png',
    'Investment': 'assets/expense_icons/profits.png',
    'Household': 'assets/expense_icons/appliances.png',
    'Kids': 'assets/expense_icons/children.png',
    'Office': 'assets/expense_icons/bag.png',
    'House Rent': 'assets/expense_icons/home.png',
    'Travel': 'assets/expense_icons/destination.png',
    'Leisure': 'assets/expense_icons/golf-player.png',
    'Grooming': 'assets/expense_icons/sparkle.png',
    'Health': 'assets/expense_icons/heartbeat.png',
    'Transport': 'assets/expense_icons/metro.png',
  };

  String? imageRoute(String categoryName) {
    return map1[categoryName];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text(
            "Budgets",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
          ),
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
            const SizedBox(height: 10),
            Container(
              child: const Text("Your Budgets",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal)),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.circular(17.0),
                ),
                width: double.infinity,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(FirestoreBuckets.users)
                      .doc(getEmail())
                      .collection(FirestoreBuckets.budgets)
                      .snapshots(),
                  builder: (___,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      print("Total Documents: ${snapshot.data!.docs.length}");
                      if (snapshot.data!.docs.isNotEmpty) {
                        return Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, int index) {
                              Map<String, dynamic> docData =
                                  snapshot.data!.docs[index].data();

                              if (docData.isEmpty) {
                                return const Text(
                                  "Document is Empty",
                                  textAlign: TextAlign.center,
                                );
                              }
                              String category =
                                  docData[FirestoreBuckets.categoryName];
                              int budget = docData[FirestoreBuckets.budget];
                              return Container(
                                height: 65.0,
                                margin: const EdgeInsets.only(top:16.0, left: 14.0, right: 14.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 13.0, right: 13.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 40.0,
                                        width: 40.0,
                                        child:
                                            Image.asset(imageRoute(category)!),
                                      ),
                                      // const SizedBox(width: 20.0),
                                      Text(
                                        category,
                                        style: const TextStyle(fontSize: 22.0),
                                      ),
                                      //const SizedBox(width: 18.0),
                                      Text(
                                        "₹$budget",
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(fontSize: 24.0,
                                        fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              );
                              //
                              // String category = docData[FirestoreBuckets.categoryName];
                              // int budget = docData[FirestoreBuckets.budget];
                              // return Column(
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(
                              //         top: 15.0,
                              //         left: 13.0,
                              //         right: 13.0,
                              //       ),
                              //       child: Row(
                              //         children: [
                              //           Container(
                              //             height: 70.0,
                              //             width: double.infinity,
                              //             decoration: BoxDecoration(
                              //                 color: Colors.white,
                              //                 borderRadius:
                              //                 BorderRadius.circular(15.0)),
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(10.0),
                              //               child: Text(
                              //                 category,
                              //                 textAlign: TextAlign.center,
                              //               ),
                              //             ),
                              //           ),
                              //           Container(
                              //             height: 70.0,
                              //             width: double.infinity,
                              //             decoration: BoxDecoration(
                              //                 color: Colors.white,
                              //                 borderRadius:
                              //                 BorderRadius.circular(15.0)),
                              //             child: Padding(
                              //               padding: const EdgeInsets.all(10.0),
                              //               child: Text(
                              //                 budget.toString(),
                              //                 textAlign: TextAlign.center,
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // );
                            },

                            // separatorBuilder: (___, ____) {
                            //   return const Divider();
                            // },
                            // itemCount: snapshot.data!.docs.length,
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "To start adding budgets, click on create budget!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 19.0),
                          ),
                        );
                      }
                    } else {
                      return const Center(
                        child: Text("Getting Error"),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
