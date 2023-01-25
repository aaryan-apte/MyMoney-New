// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:my_money/nav_pages/budgets/budgets_page.dart';
// import 'package:my_money/pages/select_category/expense_category.dart';
// import 'package:my_money/pages/select_category/income_category.dart';

class EnterBudgetAmount extends StatefulWidget {
  String budgetCategory;

  EnterBudgetAmount({super.key, required this.budgetCategory});

  @override
  _EnterBudgetAmountState createState() => _EnterBudgetAmountState();
}

class _EnterBudgetAmountState extends State<EnterBudgetAmount> {
  @override
  late String budgetCategoryAdd;
  void initState() {
    budgetCategoryAdd = widget.budgetCategory;
  }

  Future<void> addBudget() async {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // final User uid = auth.currentUser!().getEmail();
    final String? uid = FirebaseAuth.instance.currentUser?.email;

    Map<String, int> map1 = {budgetCategoryAdd: int.parse(texttodisplay)};

    // CollectionReference user1 = FirebaseFirestore.instance.collection('users');
    // DocumentReference user2 = user1.doc(uid.toString());
    // CollectionReference user3 = user2.collection('goals');
    // DocumentReference user4 = user3.doc(uid.toString());
    var user1 = FirebaseFirestore.instance
        .collection('users')
        .doc(uid.toString())
        .collection('budgets')
        .doc();

    final docID1;
    final docID;

    var user2 = FirebaseFirestore.instance
        .collection('users')
        .doc(uid.toString())
        .collection('budgets');

    try {
      
    // bool ok;
    // user1.get().then((onexist){
    // onexist.exists ? ok = true : ok = false;
    // }
      if(await user1.get().then((onexist) => onexist.exists)){
        await user1.update({budgetCategoryAdd: FieldValue.increment(int.parse(texttodisplay))}).then((value) => print("Success"));
      }
      else{
        await user2.add({budgetCategoryAdd: FieldValue.increment(int.parse(texttodisplay))}).then((value) => print("success"));
        docID1 = user2.doc().get();
        docID = docID1.

      }

  
        // await user1.add({
        //   budgetCategoryAdd: FieldValue.increment(int.parse(texttodisplay))
        // }).then((value) => print("Success"));
      // if(querySnapshot.)
      // await user1.FieldValue
      // await user1
      //     .doc(uid.toString())
      //     .collection('goals')
      //     .updateDoc()
      //     .then((value) => print("Success"));
    } catch (e) {
      print(e.toString());
    }
  }

  // widget.category;
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";

  late String res;
  late String operatortoperform;
  void btnclicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "÷") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "÷") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(
      () {
        texttodisplay = res;
      },
    );
  }

  Widget customButtom(String btnval) {
    return Expanded(
      child: Container(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(25.0),
            backgroundColor: Colors.white,
          ),
          onPressed: () => btnclicked(btnval),
          child: Text(btnval,
              style: const TextStyle(fontSize: 25.0, color: Colors.black)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Enter monthly limit for this category",
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 10,
          ),
        ),
      ),
      //backgroundColor: Colors.grey,
      /*body: Container(
        child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: Color(0xffe91e63),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),),
                ),
              ),
              const SizedBox(height: 10),
             Center(
                child: Container(
                   height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),)
                    ),
                    //color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Enter the Amount',
                            hintStyle: TextStyle(color:Colors.grey, fontSize: 10),
                            labelText: '₹',
                            labelStyle: TextStyle(color:Colors.blueAccent, fontSize: 50)
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    )
                ),
              ),*/
      body: Container(
        //height: 650,
        decoration: const BoxDecoration(color: Colors.orange),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            /*Expanded(
                        child: Container(
                          height: 200 ,
                          child: TextField(
                          decoration: const InputDecoration(
                          hintText: 'Add a note',
                          hintStyle: TextStyle(color:Colors.grey, fontSize: 10),
                          labelStyle: TextStyle(color:Colors.blueAccent, fontSize: 50)
                          ),
                        )
                    ),
                    ),*/
            Expanded(
              child: Container(
                height: 400,
                alignment: Alignment.bottomRight,
                child: Text("Rs $texttodisplay",
                    style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
            ),
            Row(
              children: <Widget>[
                customButtom("9"),
                customButtom("8"),
                customButtom("7"),
                customButtom("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButtom("6"),
                customButtom("5"),
                customButtom("4"),
                customButtom("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButtom("3"),
                customButtom("2"),
                customButtom("1"),
                customButtom("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customButtom("C"),
                customButtom("0"),
                customButtom("="),
                customButtom("÷"),
              ],
            ),
            Container(
              width: 400,
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(25.0),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  addBudget();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text("SET BUDGET",
                    style: TextStyle(fontSize: 25.0, color: Colors.purple)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
