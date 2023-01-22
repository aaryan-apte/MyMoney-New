import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:my_money/nav_pages/budgets/budgets_page.dart';
// import 'package:my_money/pages/select_category/expense_category.dart';
// import 'package:my_money/pages/select_category/income_category.dart';

class EnterBudgetAmount extends StatefulWidget {
  const EnterBudgetAmount({super.key});

  @override
  _EnterBudgetAmountState createState() => _EnterBudgetAmountState();
}

class _EnterBudgetAmountState extends State<EnterBudgetAmount> {
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
                customButtom("2"),
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
