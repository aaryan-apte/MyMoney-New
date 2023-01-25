import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  final List _goals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Center(
          child: Text("Goals",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      body: Container(
        color: Colors.lightGreen,
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
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, 'goalentry')},
                      child:
                          // Image.asset('assets/goals_icon/targetgoal.png'),
                          Text(
                        '   + CREATE GOAL',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ListView.builder(
            //   itemCount: _goals.length,
            //   itemBuilder: (context, index) {
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0),
            //       child: Container(
            //         height: 50,
            //         decoration: const BoxDecoration(
            //           color: Colors.white,
            //         ),
            //         child: _goals[index],
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
