import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_money/nav_pages/budgets/budget_backend/buckets.firestore.dart';
import 'addIncome.dart';

class IncomePage extends StatefulWidget {
  IncomePage(this.colorVal, {super.key});
  int colorVal;
  //const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage>
    with SingleTickerProviderStateMixin {
  String? getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser!.email;
    return uid;
  }

  int income = 0;
  int totalSavings = 0;

  late final Stream<DocumentSnapshot<Map<String, dynamic>>> incomeData;
  // late final incomeData1;

  @override
  void initState() {
    super.initState();

    incomeData = FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(getEmail())
        .collection(FirestoreBuckets.income)
        .doc(FirestoreBuckets.incomeDocument)
        .snapshots();
    final incomeData1 = FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(getEmail())
        .collection(FirestoreBuckets.income)
        .doc(FirestoreBuckets.incomeDocument);

    try {
      incomeData1.get().then((doc) async {
        if (doc.exists == false) {
          await incomeData1.set({
            FirestoreBuckets.income: 0,
            FirestoreBuckets.totalSavings: 0
          });
          // await incomeData1.set({
          //   FirestoreBuckets.income: 0,
          //   FirestoreBuckets.totalSavings: 0
          // }).then((value) => print("Success"));
        }
      });
    } catch (e) {
      print(e);
    }
    // stream1 = incomeData.
  }
  //
  // void setIncomeData() {
  //   incomeData = FirebaseFirestore.instance
  //       .collection(FirestoreBuckets.users)
  //       .doc(getEmail())
  //       .collection(FirestoreBuckets.income)
  //       .doc(FirestoreBuckets.incomeDocument)
  //       .snapshots();
  // }

  // Future<int> getIncome() async {
  //   var incomeData = FirebaseFirestore.instance
  //       .collection(FirestoreBuckets.users)
  //       .doc(getEmail())
  //       .collection(FirestoreBuckets.income)
  //       .doc(FirestoreBuckets.incomeDocument).snapshots();
  //
  //   int income = incomeData[FirestoreBuckets.income]
  // }

  @override
  Widget build(BuildContext context) {
    late int incomeToPass;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: StreamBuilder<DocumentSnapshot>(
            stream: incomeData,
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(snapshot.error.toString()),
                  ),
                );
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator(backgroundColor: Colors.white, color: Colors.blue[900],);
              }
              Map<String, dynamic> docData =
                  snapshot.data!.data() as Map<String, dynamic>;
              if (docData.isNotEmpty) {
                income = docData[FirestoreBuckets.income];
                incomeToPass = income;
                totalSavings = docData[FirestoreBuckets.totalSavings];
                return Column(
                  children: [
                    Container(
                      height: 70.0,
                      margin: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.lightGreen[700],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/income_icons/save-money.png'),
                            // Text(income.toString()),
                            // const Text("Income"),
                            // const SizedBox(width: 20.0),
                            // Text(totalSavings.toString())
                            const Text(
                              "Income",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            Text(
                              "₹$income",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 70.0,
                      margin: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.lightGreen[700],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(income.toString()),
                            // const Text("Income"),
                            // const SizedBox(width: 20.0),
                            // Text(totalSavings.toString())
                            Image.asset('assets/income_icons/piggy-bank.png'),
                            const Text(
                              "Savings Till Date",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            Text(
                              "₹$totalSavings",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                    child: Text("Please add income by clicking on +"));
              }
            }
            // else{
            //   return Text("Hare Krishna");
            // }
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddIncome(income: incomeToPass)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
