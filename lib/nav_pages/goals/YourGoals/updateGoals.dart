import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../budgets/budget_backend/buckets.firestore.dart';

class UpdateGoals extends StatefulWidget {
  UpdateGoals({super.key, required this.oldAmount, required this.docID});
  int oldAmount;
  String docID;

  @override
  State<UpdateGoals> createState() => _UpdateGoalsState();
}

class _UpdateGoalsState extends State<UpdateGoals> {
  late int oldAmount;
  late String docID;

  @override
  void initState() {
    super.initState();
    oldAmount = widget.oldAmount;
    docID = widget.docID;
  }

  TextEditingController goalToUpdate = TextEditingController();

  Future<void> updateGoal() async {
    final String? uid = FirebaseAuth.instance.currentUser?.email;

    Map<String, dynamic> map1 = {
      "savedAmount": int.parse(goalToUpdate.text.trim())
    };

    final user1 = FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(uid.toString())
        .collection(FirestoreBuckets.goals)
        .doc(docID);

    try {
      await user1.update(map1).then((value) => print("Success"));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Modify Saved Amount",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
          // textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[900]),
                margin: const EdgeInsets.only(
                    top: 54.0, left: 11.0, right: 11.0, bottom: 54.0),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "The previous amount was",
                        style: TextStyle(color: Colors.white, fontSize: 23.0),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "₹$oldAmount",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          controller: goalToUpdate,
                          decoration: const InputDecoration(
                              hintText: "Enter new amount",
                              hintStyle: TextStyle(color: Colors.white38)),
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextButton(
                        onPressed: () {
                          updateGoal();
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Update Saved Amount",
                              style: TextStyle(
                                  color: Colors.blue[900], fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
