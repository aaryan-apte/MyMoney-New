// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../nav_pages/budgets/budget_backend/buckets.firestore.dart';
// import 'addexpense.dart';

class ExpenseYearTab extends StatefulWidget {
  const ExpenseYearTab({Key? key}) : super(key: key);

  @override
  State<ExpenseYearTab> createState() => _ExpenseYearTabState();
}

class _ExpenseYearTabState extends State<ExpenseYearTab> {
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
    getBudgetandExpense();
    setState(() {
      _future = _sumYear();
    });
  }

  void updateSum() {
    setState(() {
      _future = _sumYear();
    });
  }

  // int getExpenseDay() {
  //   // super.initState();
  //   int expenseDay = 0;
  //   var stream1 = FirebaseFirestore.instance
  //       .collection(FirestoreBuckets.users)
  //       .doc(getEmail())
  //       .collection(FirestoreBuckets.dates)
  //       .doc(dateToday)
  //       .collection(FirestoreBuckets.expenses)
  //       .snapshots()
  //       .listen((snap) {
  //     final dateDocs = snap.docs.map((doc) => doc.data());
  //
  //     for (var dateData in dateDocs) {
  //       if (dateData[FirestoreBuckets.expense] > 0) {
  //         expenseDay =
  //             expenseDay + int.parse(dateData[FirestoreBuckets.expense]);
  //       }
  //     }
  //   });
  //   return expenseDay;
  // }

  // Future<num> _sum() async => await FirebaseFirestore.instance
  //     .collection(FirestoreBuckets.users)
  //     .doc(getEmail())
  //     .collection(FirestoreBuckets.dates)
  //     .doc(dateToday)
  //     .collection(FirestoreBuckets.expenses)
  //     .get()
  //     .then((querySnapshot) async {
  //   num sum = 0.0;
  //   querySnapshot.docs.forEach((element) async {
  //     // here I want to sum
  //     querySnapshot.docs.forEach((element) async {
  //       num value = element.data()[FirestoreBuckets.expense];
  //       sum = sum + value;
  //     });
  //     print(sum);
  //   }
  //   );
  //   return sum;
  // }
  // );

  late num expense;
  late num budget;
  final String? email = FirebaseAuth.instance.currentUser?.email;

  Future<num> _sumYear() async => FirebaseFirestore.instance
          .collection(FirestoreBuckets.users)
          .doc(email)
          .collection(FirestoreBuckets.dates)
          .doc(DateTime.now().year.toString())
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
        .doc(DateTime.now().year.toString())
        .collection(DateTime.now().month.toString())
        .doc()
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
                          snapshot.data!.docs.forEach((element) {
                            num value =
                                element.data()[FirestoreBuckets.expense];
                            sum += value;
                          });

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
                      .collection(FirestoreBuckets.expenses)
                      .snapshots(),
                  builder: (___,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      print("Total Documents: ${snapshot.data!.docs.length}");
                      if (snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
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
                            final documents = snapshot.data?.docs;
                            String category =
                                docData[FirestoreBuckets.categoryName];
                            int expense = docData[FirestoreBuckets.expense];
                            if (expense == 0) {
                              return Container();
                            }
                            // expenseDay = expenseDay + expense;
                            return Container(
                              height: 65.0,
                              margin: const EdgeInsets.only(
                                  top: 16.0, left: 14.0, right: 14.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 13.0, right: 13.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 40.0,
                                      width: 40.0,
                                      child: Image.asset(imageRoute(category)!),
                                    ),
                                    // const SizedBox(width: 20.0),
                                    Text(
                                      category,
                                      style: const TextStyle(
                                          fontSize: 22.0, color: Colors.black),
                                    ),
                                    //const SizedBox(width: 18.0),
                                    Text(
                                      "₹$expense",
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            );
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
