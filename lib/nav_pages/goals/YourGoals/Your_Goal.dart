import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/nav_pages/goals/goals_backend/buckets.firestore.dart';
import 'package:my_money/nav_pages/goals/goals_backend/fields.firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Your_Goal extends StatefulWidget {
  const Your_Goal({Key? key}) : super(key: key);

  @override
  State<Your_Goal> createState() => _Your_GoalState();
}

class _Your_GoalState extends State<Your_Goal> {

  String? getEmail(){
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser!.email;
    return uid;
  }

  void updateDocument() {}

  // Future<String?> getDocumentID() async{
  //   return FirebaseFirestore.instance.collection(FirestoreBuckets.users)
  //       .doc("$getEmail()")
  //       .collection(FirestoreBuckets.goals).doc().
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Goals",
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(FirestoreBuckets.users)
              .doc(getEmail())
              .collection(FirestoreBuckets.goals)
              .snapshots(),
          builder: (___,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
                    String goalName = docData[FireStoreFields.goalName];
                    int savedAmount = docData[FireStoreFields.savedAmount];
                    int targetAmount = docData[FireStoreFields.targetAmount];
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
                          "$goalName\n",
                          style: const TextStyle(
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
                            percent: savedAmount / targetAmount,
                            leading: Text("Rs $savedAmount"),
                            trailing: Text("Rs $targetAmount"),
                            center: Text(
                              "${((savedAmount / targetAmount) * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.blueAccent,
                            backgroundColor: Colors.grey[300],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  foregroundColor: Colors.black),
                              child: const Text("Update Saved Amount"),
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  foregroundColor: Colors.black),
                              child: const Text("Set Goal As Reached"),
                            ),
                          )
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
      ),
    );
  }
}