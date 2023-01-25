import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    Future<void> addGoal() async {
      final goalNameAdd = goalName.text.trim();
      final targetAmountAdd = int.parse(targetAmount.text.trim());
      final savedAmountAdd = int.parse(savedAmount.text.trim());

      CollectionReference user1 =
          FirebaseFirestore.instance.collection('users');


      Map<String, dynamic> map1 = {
        "goalName": goalNameAdd,
        "targetAmount": targetAmountAdd,
        "savedAmount": savedAmountAdd
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('               New Goal'),
        backgroundColor: Colors.orange,
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
                      onPressed: () => {
                        // Map <String, int> goalData = {};
                        Navigator.pushNamed(context, 'goalpage')
                      },
                      child: Row(
                        children: [
                          // Image.asset('assets/goals_icon/targetgoal.png'),
                          TextButton(
                            child: const Text(
                              ' SAVE GOAL ',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                            onPressed: () {
                              addGoal();
                            },
                          )
                        ],
                      ),
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
