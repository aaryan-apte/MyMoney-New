import 'package:flutter/material.dart';

class IncrementExpense extends StatefulWidget {

  String category;
  int expenditureOld;
  IncrementExpense({super.key, required this.category, required this.expenditureOld});


  @override
  State<IncrementExpense> createState() => _IncrementExpenseState();
}

class _IncrementExpenseState extends State<IncrementExpense> {
  late String category;
  late int expenseOld;
  void initstate(){
    category = widget.category;
    expenseOld = widget.expenditureOld;
  }

  Color PrimaryColor = Color(0xff109618);
  TextEditingController expenseIncrement = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: const Center(
            child: Text(
              "Paisa 'o Paisa",
              style: TextStyle(
                  fontSize: 26.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Set the expense amount of $category\nPrevious value was $expenseOld'
                )
              ),
            ),
            TextField(
              controller: expenseIncrement,
              decoration: InputDecoration(
                hintText: ''
              ),
            )
          ],
        ),
      ),
    );
  }
}
