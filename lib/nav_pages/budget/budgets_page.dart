// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:my_money/nav_pages/budgets/budget_category_page.dart';
// import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  // final List _limits = [];
  String budgetCategory = "";

  Future<void> addBudget() async {
    final budgetCategoryAdd = budgetCategory;
    // final targetAmountAdd = int.parse(targetAmount.text.trim());
    // final savedAmountAdd = int.parse(savedAmount.text.trim());

    CollectionReference user1 = FirebaseFirestore.instance.collection('users');

    Map<String, dynamic> map1 = {
      "goalName": budgetCategoryAdd,
      // "targetAmount": targetAmountAdd,
      // "savedAmount": savedAmountAdd
    };
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User uid = auth.currentUser!;

    try {
      await user1
          .doc(uid.toString())
          .collection('goals')
          .add(map1)
          .then((value) => print("Success"));
      // await user1
      //     .doc(uid.toString())
      //     .collection('goals')
      //     .updateDoc()
      //     .then((value) => print("Success"));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Text("Budgets",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500)),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(getEmail())
                    .collection('budgets')
                    .snapshots(),
                builder: (___,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    print("Total Documents: ${snapshot.data!.docs.length}");
                    if (snapshot.data!.docs.isNotEmpty) {
                      return ListView.separated(
                        itemBuilder: (___, int index) {
                          Map<String, dynamic> docData =
                              snapshot.data!.docs[index].data();

                          if (docData.isEmpty) {
                            return const Text(
                              "Document is Empty",
                              textAlign: TextAlign.center,
                            );
                          }
                          String category = docData["categoryName"];
                          int budget = docData["budget"];
                          // int targetAmount = docData[FireStoreFields.targetAmount];
                          return Card(
                            elevation: 4,
                            color: Colors.lightGreen,
                            child: Column(
                              children: [
                                // iconColor: Colors.white,
                                // collapsedIconColor: Colors.white,
                                // childrenPadding: const EdgeInsets.symmetric(
                                //     vertical: 10, horizontal: 20),
                                // expandedCrossAxisAlignment: CrossAxisAlignment.end,
                                Text(
                                  "$category\n",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(
                                  "$budget\n",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            //subtitle: Text(savedAmount.toString() +" "+ targetAmount.toString())
                          );
                        },
                        separatorBuilder: (___, ____) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
                    } else {
                      return const Center(
                        child: Text("Document not available"),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text("Getting Error"),
                    );
                  }
                },
              ),
              // child: ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   itemCount: 15,
              //   itemBuilder: (context, int index) {
              //     return Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(
              //             top: 15.0,
              //             left: 13.0,
              //             right: 13.0,
              //           ),
              //           child: Container(
              //             height: 70.0,
              //             width: double.infinity,
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(15.0)),
              //             child: Padding(
              //               padding: const EdgeInsets.all(10.0),
              //               child: Text('SSS',
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         ),
              //         // SizedBox(height: 10.0,),
              //       ],
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }

  String? getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser!.email;
    return uid;
  }
  //
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         "Your Goals",
  //         style: TextStyle(fontSize: 24.0),
  //       ),
  //       backgroundColor: Colors.orange,
  //     ),
  //     backgroundColor: Colors.white,
  //     body: SafeArea(
  //       child: StreamBuilder(
  //         stream: FirebaseFirestore.instance
  //             .collection('users')
  //             .doc(getEmail())
  //             .collection('goals')
  //             .snapshots(),
  //         builder: (___,
  //             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
  //           if (snapshot.hasData && snapshot.data != null) {
  //             print("Total Documents: ${snapshot.data!.docs.length}");
  //             if (snapshot.data!.docs.isNotEmpty) {
  //               return ListView.separated(
  //                 itemBuilder: (___, int index) {
  //                   Map<String, dynamic> docData =
  //                   snapshot.data!.docs[index].data();
  //
  //                   if (docData.isEmpty) {
  //                     return const Text(
  //                       "Document is Empty",
  //                       textAlign: TextAlign.center,
  //                     );
  //                   }
  //                   String category = docData["categoryName"];
  //                   int budget = docData["budget"];
  //                   // int targetAmount = docData[FireStoreFields.targetAmount];
  //                   return Card(
  //                     elevation: 4,
  //                     color: Colors.lightGreen,
  //                     child: Column(
  //                       children: [
  //                         // iconColor: Colors.white,
  //                       // collapsedIconColor: Colors.white,
  //                       // childrenPadding: const EdgeInsets.symmetric(
  //                       //     vertical: 10, horizontal: 20),
  //                       // expandedCrossAxisAlignment: CrossAxisAlignment.end,
  //                       Text(
  //                         "$category\n",
  //                         style: const TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.w700,
  //                           fontStyle: FontStyle.italic,
  //                         ),
  //                       ),
  //                   ],
  //                     ),
  //                     //subtitle: Text(savedAmount.toString() +" "+ targetAmount.toString())
  //                   );
  //                 },
  //                 separatorBuilder: (___, ____) {
  //                   return const Divider();
  //                 },
  //                 itemCount: snapshot.data!.docs.length,
  //               );
  //             } else {
  //               return const Center(
  //                 child: Text("Document not available"),
  //               );
  //             }
  //           } else {
  //             return const Center(
  //               child: Text("Getting Error"),
  //             );
  //           }
  //         },
  //       ),
  //
  //   );
  // }
}
