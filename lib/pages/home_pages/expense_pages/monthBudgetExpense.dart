import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../nav_pages/budgets/budget_backend/buckets.firestore.dart';

class MonthBudgetExpenseWidget extends StatefulWidget {
  MonthBudgetExpenseWidget(
      {Key? key,
      required this.category,
      required this.image,
      required this.expense})
      : super(key: key);
  String category, image, expense;

  @override
  State<MonthBudgetExpenseWidget> createState() =>
      _MonthBudgetExpenseWidgetState();
}

class _MonthBudgetExpenseWidgetState extends State<MonthBudgetExpenseWidget> {
  String budgetGot = "0";

  @override
  void initState() {
    // TODO: implement initState
    getBudgetAmount(widget.category);
    super.initState();
  }

  void getBudgetAmount(String category) {
    final String? email = FirebaseAuth.instance.currentUser?.email;
    var path = FirebaseFirestore.instance
        .collection(FirestoreBuckets.users)
        .doc(email)
        .collection(FirestoreBuckets.budgets)
        .doc(category);

    Map<String, dynamic>? map1 = {};

    path.get().then(
          (doc) => {
            if (doc.exists == true)
              {
                map1 = doc.data(),
                setState(() {
                  budgetGot = map1![FirestoreBuckets.budget].toString();
                }),
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    if (int.parse(widget.expense) > int.parse(budgetGot)) {
      return Container(
        // height: 110.0,
        margin: const EdgeInsets.only(top: 16.0, left: 14.0, right: 14.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: Image.asset(widget.image),
                  ),
                  Text(
                    widget.category,
                    style: const TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40.0,
                    width: 40.0,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "₹${widget.expense}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    "Overspent by ₹${int.parse(widget.expense) - (int.parse(budgetGot))}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    "₹${budgetGot.toString()}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              // SizedBox(height: 15.0),
            ],
          ),
        ),
      );
    }

    return Container(
      // height: 110.0,
      margin: const EdgeInsets.only(top: 16.0, left: 14.0, right: 14.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: Image.asset(widget.image),
                  ),
                  Text(
                    widget.category,
                    style: const TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40.0,
                    width: 40.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              LinearPercentIndicator(
                barRadius: const Radius.circular(9.0),
                //leaner progress bar
                animation: true,
                animationDuration: 1000,
                lineHeight: 18.0,
                percent: int.parse(widget.expense) / int.parse(budgetGot),
                leading: Text("₹${widget.expense}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                trailing: Text(
                  "₹${budgetGot.toString()}",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                center: Text(
                  "${((int.parse(widget.expense) / int.parse(budgetGot)) * 100).toStringAsFixed(0)}%",
                  style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                progressColor: Colors.blue[300],
                backgroundColor: Colors.grey[300],
              ),
            ]),
      ),
    );
  }
}
