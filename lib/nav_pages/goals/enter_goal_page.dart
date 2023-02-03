import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_money/nav_pages/budgets/budget_backend/buckets.firestore.dart';
// import 'package:my_money/nav_pages/goals/goals_page.dart';
// import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';

class GoalEntry extends StatefulWidget {
  const GoalEntry({Key? key}) : super(key: key);

  @override
  State<GoalEntry> createState() => _GoalEntryState();
}

class _GoalEntryState extends State<GoalEntry> {
  @override
  Widget build(BuildContext context) {
    TextEditingController goalName = TextEditingController();
    TextEditingController targetAmount = TextEditingController();
    TextEditingController savedAmount = TextEditingController();

    void addGoal() async {
      final goalNameAdd = goalName.text.trim();
      final targetAmountAdd = int.parse(targetAmount.text.trim());
      final savedAmountAdd = int.parse(savedAmount.text.trim());

      Map<String, dynamic> map1 = {
        "goalName": goalNameAdd,
        "targetAmount": targetAmountAdd,
        "savedAmount": savedAmountAdd
      };

      final FirebaseAuth auth = FirebaseAuth.instance;
      final String? uid = auth.currentUser!.email;

      try {
        FirebaseFirestore.instance
            .collection(FirestoreBuckets.users)
            .doc(uid)
            .collection(FirestoreBuckets.goals)
            .add(map1)
            .then((value) => print("GoalName: $goalNameAdd\nTarget Amount: $targetAmountAdd\nSaved Already: $savedAmountAdd"));
        // await user1
        //     .doc(uid.toString())
        //     .collection('goals')
        //     .updateDoc()
        //     .then((value) => print("Success"));
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '             New Goal',
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: goalName,
                  decoration: const InputDecoration(
                    hintText: "Please Enter your goal's name",
                    labelText: "Goal Name",
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: targetAmount,
                  decoration: const InputDecoration(
                    hintText: 'Enter the Target Amount',
                    //hintStyle: TextStyle(color:Colors.grey, fontSize: 10),
                    labelText: 'Target Amount',
                    //labelStyle: TextStyle(color:Colors.blueAccent, fontSize: 50)
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: savedAmount,
                  decoration: const InputDecoration(
                    hintText: 'Enter the Amount Saved Already',
                    //hintStyle: TextStyle(color:Colors.grey, fontSize: 10),
                    labelText: 'Saved Already',
                    //labelStyle: TextStyle(color:Colors.blueAccent, fontSize: 50)
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: const BorderRadius.only(
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
                      // Map <String, int> goalData = {};
                      Navigator.pushNamed(context, 'goalpage'),
                      Navigator.pop(context),
                      Navigator.pop(context),
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/goals_icons/target.png'),
                        TextButton(
                          child: const Text(
                            ' SAVE GOAL ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                          onPressed: () {
                            addGoal();
                            Navigator.pop(context);
                            // Navigator.pop(context);
                            // Navigator.pushNamed(context, 'goalpage');
                          },
                        )
                      ],
                    ),
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
