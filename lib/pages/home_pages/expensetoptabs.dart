// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:my_money/pages/home_pages/expense_pages/expensedaytab.dart';
import 'package:my_money/pages/home_pages/expense_pages/expensemonthtab.dart';
import 'package:my_money/pages/home_pages/expense_pages/expenseweektab.dart';
import 'package:my_money/pages/home_pages/expense_pages/expenseyeartab.dart';

class ExpenseTopTabs extends StatefulWidget {
  ExpenseTopTabs(this.colorVal);
  int colorVal;

  @override
  _ExpenseTopTabsState createState() => _ExpenseTopTabsState();
}

class _ExpenseTopTabsState extends State<ExpenseTopTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String period = "Day";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(
      () {
        widget.colorVal = 0xffe91e63;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int amountDay = 25000;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: Colors.green,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Day',
              ),
              Tab(
                text: 'Week',
              ),
              Tab(
                text: 'Month',
              ),
              Tab(
                text: 'Year',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ExpenseDayTab(),
            ExpenseWeekTab(),
            ExpenseMonthTab(),
            ExpenseYearTab(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required TabController tabController,
    required this.amountDay,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final int amountDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 7.0),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Day',
                  ),
                  Tab(
                    text: 'Week',
                  ),
                  Tab(
                    text: 'Month',
                  ),
                  Tab(
                    text: 'Year',
                  ),
                ],
              ),
            ),
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
                          'You\'ve spent ₹$amountDay',
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
