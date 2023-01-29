import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/nav_pages/goals/goals_backend/buckets.firestore.dart';
import 'package:my_money/nav_pages/goals/goals_backend/fields.firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';


class Trial extends StatelessWidget {
  const Trial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                .doc("gholesailie1410@gmail.com")
                .collection(FirestoreBuckets.goals)
                .snapshots(),
            builder: (___, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot)
            {
              if(snapshot.hasData && snapshot.data != null){
                print("Total Documents: ${snapshot.data!.docs.length}");
                if(snapshot.data!.docs.isNotEmpty){

                  return ListView.separated(
                    itemBuilder: (___, int index){

                      Map<String, dynamic> docData =
                      snapshot.data!.docs[index].data();

                      if(docData.isEmpty){
                        return const Text(
                          "Document is Empty",
                          textAlign: TextAlign.center,
                        );
                      }
                      String goalName = docData[FireStoreFields.goalName];
                      int savedAmount = docData[FireStoreFields.savedAmount];
                      int targetAmount = docData[FireStoreFields.targetAmount];
                      return ListTile(
                        title: Text(goalName),
                        subtitle: Text(savedAmount.toString() +" "+ targetAmount.toString()),


                      );
                    },
                    separatorBuilder: ( ___, ____ ){
                      return const Divider();
                    },
                    itemCount: snapshot.data!.docs.length,
                  );

                }else{
                  return const Center(
                      child: Text("Document not available")
                  );
                }
              }else return const Center(
                  child: Text("Getting Error")
              );
            },
          )
      )
    );
  }
}
