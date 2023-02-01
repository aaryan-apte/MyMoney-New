import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/nav_pages/goals/goals_backend/buckets.firestore.dart';
import 'package:my_money/nav_pages/goals/goals_backend/fields.firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';

class YourGoals extends StatefulWidget {
  const YourGoals({Key? key}) : super(key: key);

  @override
  State<YourGoals> createState() => _YourGoalsState();
}

class _YourGoalsState extends State<YourGoals> {
  //late double _height;
  //late double _width;

  @override
  @override
  Widget build(BuildContext context) {
    final String? email = FirebaseAuth.instance.currentUser?.email;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Goals"),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(FirestoreBuckets.users)
              .doc(email)
              .collection(FirestoreBuckets.goals)
              .snapshots(),
          builder: (___,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              print("Total Documents: ${snapshot.data!.docs.length}");
              if (snapshot.data!.docs.isNotEmpty) {
                return ListView.separated(
                  itemBuilder: (context, int index) {
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
                    return ListTile(
                      title: Text(
                        "$goalName\n",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      //subtitle: Text(savedAmount.toString() +" "+ targetAmount.toString()),
                      subtitle: Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        alignment: Alignment.center,
                        child: LinearPercentIndicator(
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
                          progressColor: Colors.orange,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
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
            } else {
              return const Center(child: Text("Getting Error"));
            }
          },
        ),
      ),
    );
  }
}
