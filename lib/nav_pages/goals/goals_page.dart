// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:my_money/nav_pages/goals/YourGoals.dart';
import 'package:my_money/nav_pages/goals/YourGoals/Your_Goal.dart';
import 'package:my_money/nav_pages/goals/enter_goal_page.dart';
// import 'package:my_money/nav_pages/goals/goals_backend/buckets.firestore.dart';
// import 'package:my_money/nav_pages/goals/goals_backend/fields.firestore.dart';
// import 'package:my_money/nav_pages/goals/trial_page.dart';
// import 'package:my_money/nav_pages/budgets/budget_category_page.dart';
// import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';
// import 'package:my_money/nav_pages/goals/enter_goal_page.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  // final len = Object.keys(map1).length;

// Future <StreamBuilder> countGet() async{
//   User uid = FirebaseAuth.instance.currentUser!;
//   final streamFirebase =
//   FirebaseFirestore.instance.collection('users').doc(uid.toString()).snapshots();
//
//   return StreamBuilder<void>(
//     stream: streamFirebase,
//     builder: (context, AsyncSnapshot<QuerySnapshot<Snapshots?>>){
//   if(stream.){
//
//   }
//   },
//   );
// }

// User uid = FirebaseAuth.instance.currentUser!;
// String uidString = uid.toString();
// final user1 =
// FirebaseFirestore.instance.collection('users').doc(uid.toString()).snapshots();
//

  //final List _goals = [];

  //CollectionReference user1 = FirebaseFirestore.instance.collection('users');
  //final FirebaseAuth auth = FirebaseAuth.instance;
  //final String? uid = auth.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Center(
          child: Text("Goals",
              style: TextStyle(color: Colors.white, fontSize: 28)),
        ),
      ),
      body: Container(
        color: Colors.blue[100],
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GoalEntry()))
                          },
                      child: Row(
                        children: [
                          Image.asset('assets/goals_icons/target.png'),
                          const Text(
                            '           + SET GOAL',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              // fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(height: 10),
            /*Container(
              child: Text("Your Goals", style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal)),
            ),*/

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Your_Goal()))
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        //Image.asset('assets/goals_icons/target.png'),
                        Text(
                          'Existing Goals ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            //fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /*Container(
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
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
