import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../nav_pages/budgets/budget_backend/buckets.firestore.dart';

// class IncrementExpense extends StatefulWidget {
//
//   String category;
//   int expenditureOld;
//   IncrementExpense({super.key, required this.category, required this.expenditureOld});
//
//
//   @override
//   State<IncrementExpense> createState() => _IncrementExpenseState();
// }
//
// class _IncrementExpenseState extends State<IncrementExpense> {
//   late final String category;
//   late final int expenseOld;
//   void initstate(){
//     category = widget.category;
//     expenseOld = widget.expenditureOld;
//   }
//
//   Color PrimaryColor = const Color(0xff109618);
//   TextEditingController expenseIncrement = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey,
//         appBar: AppBar(
//           backgroundColor: PrimaryColor,
//           title: const Center(
//             child: Text(
//               "Paisa 'o Paisa",
//               style: TextStyle(
//                   fontSize: 26.0,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w800
//               ),
//             ),
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: double.infinity,
//               child: Center(
//                 child: Text(
//                   'Set the expense amount of $category\nPrevious value was $expenseOld'
//                 )
//               ),
//             ),
//             TextField(
//               controller: expenseIncrement,
//               decoration: const InputDecoration(
//                 hintText: ''
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class AddExpense extends StatefulWidget {
  AddExpense(
      {super.key,
      required this.category,
      required this.oldAmount,
      required this.docID,
      required this.date});
  int oldAmount;
  String docID;
  String category;
  String date;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  late int oldAmount;
  late String docID;
  late String category;
  late String date;

  @override
  void initState() {
    super.initState();
    oldAmount = widget.oldAmount;
    docID = widget.docID;
    category = widget.category;
    date = widget.date;
  }

  TextEditingController expenseToAdd = TextEditingController();

  Future<void> updateExpense() async {
    final String? uid = FirebaseAuth.instance.currentUser?.email;

    Map<String, dynamic> map1 = {
      "categoryName": category,
      "expense": int.parse(expenseToAdd.text.trim())
    };

    final user1 = FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(uid.toString())
        .collection(FirestoreBuckets.dates)
        .doc(date)
        .collection(FirestoreBuckets.expenses)
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
          "Modify Expense",
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Previous amount for ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 23.0),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            " $category",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            " was",
                            style:
                                TextStyle(color: Colors.white, fontSize: 23.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: TextField(
                          controller: expenseToAdd,
                          decoration: InputDecoration(
                              hintText: "Total expense for $category",
                              hintStyle: const TextStyle(color: Colors.white38)),
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextButton(
                        onPressed: () {
                          updateExpense();
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              "Update $category",
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
