import 'package:flutter/material.dart';

class ExpenseWeekTab extends StatefulWidget {
  const ExpenseWeekTab({Key? key}) : super(key: key);

  @override
  State<ExpenseWeekTab> createState() => _ExpenseWeekTabState();
}

class _ExpenseWeekTabState extends State<ExpenseWeekTab> {
  int expenseWeek = 3590;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                // controller: _tabController,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      // height: 100.0,
                      // width: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          'You\'ve spent ₹$expenseWeek',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17.0,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreen[700],
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                            left: 13.0,
                            right: 13.0,
                          ),
                          child: Container(
                            height: 70.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Hare Krishna!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 10.0,),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
