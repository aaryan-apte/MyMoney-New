import 'package:flutter/material.dart';

class ExpenseDayTab extends StatefulWidget {
  const ExpenseDayTab({Key? key}) : super(key: key);

  @override
  State<ExpenseDayTab> createState() => _ExpenseDayTabState();
}

class _ExpenseDayTabState extends State<ExpenseDayTab> {

  // var date = DateTime.now();
  var date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

  int expenseDay = 890;
  late final TabController _tabController;
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
                          'You\'ve spent ₹$expenseDay',
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
                                date,
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
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Colors.blue[900],
          child: CircleAvatar(
            radius: 30.0,
            child: Icon(Icons.add),
          ),
          onPressed: () {}
      ),
    );
  }
}
