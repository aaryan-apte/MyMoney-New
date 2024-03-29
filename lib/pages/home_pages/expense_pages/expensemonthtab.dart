// import 'dart:math';

// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../nav_pages/budgets/budget_backend/buckets.firestore.dart';
import 'monthBudgetExpense.dart';
// import 'addexpense.dart';

class ExpenseMonthTab extends StatefulWidget {
  const ExpenseMonthTab({Key? key}) : super(key: key);

  @override
  State<ExpenseMonthTab> createState() => _ExpenseMonthTabState();
}

class _ExpenseMonthTabState extends State<ExpenseMonthTab> {
  // var date = DateTime.now();
  var dateToday =
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

  // int expenseDay = 0;
  String? getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser!.email;
    return uid;
  }

  late Future _future;
  @override
  void initState() {
    // getBudgetandExpense();
    setState(() {
      _future = _sum();
    });
  }

  void updateSum() {
    setState(() {
      _future = _sum();
    });
  }

  late num expense;
  late num budget;
  final String? email = FirebaseAuth.instance.currentUser?.email;

  Future<num> _sum() async => FirebaseFirestore.instance
          .collection(FirestoreBuckets.users)
          .doc(email)
          .collection(FirestoreBuckets.dates)
          .doc(DateTime.now().year.toString())
          .collection(DateTime.now().month.toString())
          .doc(FirestoreBuckets.expenses)
          .collection(FirestoreBuckets.expenses)
          .get()
          .then((querySnapshot) {
        num sum = 0;
        querySnapshot.docs.forEach((element) {
          num value = element.data()[FirestoreBuckets.expense];
          sum += value;
        });
        print(sum);
        return sum;
      });

  getBudgetandExpense() {
    FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(getEmail())
        .collection(FirestoreBuckets.dates)
        .doc(dateToday)
        .collection(FirestoreBuckets.expenses)
        .get()
        .then((querySnapshot) {
      num sum = 0;
      querySnapshot.docs.forEach((element) {
        num value = element.data()[FirestoreBuckets.expense];
        sum += value;
      });
      expense = sum;
    }).then((value) => {
              FirebaseFirestore.instance
                  .collection(FirestoreBuckets.users)
                  .doc(getEmail())
                  .collection(FirestoreBuckets.budgets)
                  .get()
                  .then((querySnapshot) {
                num sum = 0;
                querySnapshot.docs.forEach((element) {
                  print(element.data());
                  num value = element.data()[FirestoreBuckets.budget];
                  sum += value;
                });
                budget = sum;
                print("$budget   hehehehe    $expense");
              })
            });
  }

  Future<void> getBudget(String category) async {
    var userMonth = FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(email)
        .collection(FirestoreBuckets.budgets)
        .doc(category);
    var userSnapshot = await userMonth.get();
    var docData = userSnapshot.data();
    print(docData![FirestoreBuckets.expense]);
    // Map<String, dynamic> incomeToPass = userSnapshot.data as Map<String, dynamic>;
    // print(incomeToPass[FirestoreBuckets.budget]);
    // var incomeToPass = userSnapshot.then((value) {
    //   if(value.data()![FirestoreBuckets.budget] != 0){
    //     return value;
    // }
    // });
    // Map<String, dynamic> docData = {};
    // return 0;
  }

  // int getExpenseDay(){
  //   var stream1 = FirebaseFirestore.instance
  //       .collection(FirestoreBuckets.users)
  //       .doc(getEmail())
  //       .collection(FirestoreBuckets.dates)
  //       .doc(dateToday)
  //       .collection(FirestoreBuckets.expenses)
  //       .snapshots();
  //
  //   Map<String, dynamic> docData =
  //   snapshot.data!.docs[index].data();
  //
  //
  // }

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

  int budgetGot = 0;

  void getBudgetAmount(String category) {
    var path = FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(email)
        .collection(FirestoreBuckets.budgets)
        .doc(category);

    Map<String, dynamic>? map1 = {};

    path.get().then((doc) => {
          if (doc.exists == true)
            {
              // return path[FirestoreBuckets.budget];
              map1 = doc.data(),
              setState(() {
    budgetGot = map1![FirestoreBuckets.budget];
              }),

              print("Budget for $category received: $budgetGot"),
    // return budgetGot;
            }
        });
    // print("Budget for $category received: $budgetGot");

  }

  @override
  Widget build(BuildContext context) {
    final String? email = FirebaseAuth.instance.currentUser?.email;
    return Scaffold(
      // appBar: AppBar(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              // controller: _tabController,
              children: [
                const SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blue[100],
                  ),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(FirestoreBuckets.users)
                          .doc(email)
                          .collection(FirestoreBuckets.dates)
                          .doc(DateTime.now().year.toString())
                          .collection(DateTime.now().month.toString())
                          .doc(FirestoreBuckets.expenses)
                          .collection(FirestoreBuckets.expenses)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text(
                              'You\'ve spent ₹--/--',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                          );
                        } else {
                          num sum = 0;
                          for (var element in snapshot.data!.docs) {
                            num value =
                                element.data()[FirestoreBuckets.expense];
                            sum += value;
                          }
                          return Center(
                            child: Text(
                              'You\'ve spent ₹${sum}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                          );
                        }
                      }),
                ),
                const SizedBox(height: 17.0),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(17.0),
                ),
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(FirestoreBuckets.users)
                      .doc(email)
                      .collection(FirestoreBuckets.dates)
                      .doc(DateTime.now().year.toString())
                      .collection(DateTime.now().month.toString())
                      .doc(FirestoreBuckets.expenses)
                      .collection(FirestoreBuckets.expenses)
                      .snapshots(),
                  builder: (___,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (snapshot.hasData && snapshot.data != null) {
                      print("Total Documents: ${snapshot.data!.docs.length}");
                      if (snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          // if(snapshot.connectionState)
                          itemBuilder: (context, int index) {
                            Map<String, dynamic> docData =
                                snapshot.data!.docs[index].data();


                            if (docData.isEmpty) {
                              return const Text(
                                "Document is Empty",
                                textAlign: TextAlign.center,
                              );
                            }


                            final documents = snapshot.data?.docs;
                            String category =
                                docData[FirestoreBuckets.categoryName];
                            int expense = docData[FirestoreBuckets.expense];

                            if (expense == 0) {
                              return SizedBox();
                            }

                            return MonthBudgetExpenseWidget(category: category, expense: expense.toString(), image: imageRoute(category)!);
                          },
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "Start adding expenses by clicking +",
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


