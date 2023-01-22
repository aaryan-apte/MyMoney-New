import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_money/nav_pages/goals/goals_page.dart';
import 'package:my_money/nav_pages/budgets/budget_enter_limit.dart';

class GoalEntry extends StatefulWidget {
  const GoalEntry({Key? key}) : super(key: key);

  @override
  State<GoalEntry> createState() => _GoalEntryState();
}

class _GoalEntryState extends State<GoalEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Goal'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please Enter your goal's name",
                    labelText: "Goal Name",
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
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
                child: TextField(
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
            SizedBox(
              height: 20,
            ),
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
                    )),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, 'goalpage')},
                      child: Row(
                        children: [
                          Image.asset('assets/goals_icon/targetgoal.png'),
                          Text(' SAVE GOAL ',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic))
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
