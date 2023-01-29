import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../budgets/budget_backend/buckets.firestore.dart';
import '../budgets/budget_backend/fields.firestore.dart';

class Your_Budget extends StatefulWidget {
  const Your_Budget({Key? key}) : super(key: key);

  @override
  State<Your_Budget> createState() => _Your_BudgetState();
}

class _Your_BudgetState extends State<Your_Budget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Budgets"),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(FirestoreBuckets.users)
            .doc("gholesailie1410@gmail.com")
            .collection(FirestoreBuckets.budgets)
            .snapshots(),
        builder:
            (___, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
                  String categoryName = docData[FireStoreFields.categoryName];
                  int budget = docData[FireStoreFields.budget];
                  return Card(
                    elevation: 4,
                    color: Colors.lightGreen,
                    child: ExpansionTile(
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      childrenPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      title: Text(
                        categoryName + "\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      children: [
                        LinearPercentIndicator(
                          //leaner progress bar
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 20.0,
                          percent: 0,
                          //leading: new Text("Rs "+ savedAmount.toString()),
                          trailing: new Text("Rs " + budget.toString()),
                          center: Text(
                            " ",
                            // ((savedAmount/targetAmount)*100).toStringAsFixed(0) + "%",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.blueAccent,
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 20,
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
              return const Center(child: Text("Document not available"));
            }
          } else
            return const Center(child: Text("Getting Error"));
        },
      )),
    );
  }
}
