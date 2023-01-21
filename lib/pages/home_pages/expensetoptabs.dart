import 'package:flutter/material.dart';
import 'package:my_money/pages/home_pages/home_page.dart';
/*import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';
import 'package:my_money/pages/homepage/expensedaytabs.dart';
import 'package:my_money/pages/homepage/home_page.dart';*/

class ExpenseTopTabs extends StatefulWidget {
  ExpenseTopTabs(this.colorVal);
  int colorVal;

  @override
  _ExpenseTopTabsState createState() => _ExpenseTopTabsState();
}

class _ExpenseTopTabsState extends State<ExpenseTopTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    _tabController.addListener(_handleTabSelection);
  }

  //sets the color for next tabs too
  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xffe91e63;
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Color(0xffe91e63),
              indicatorWeight: 4.0,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Day',
                    style: TextStyle(
                        color: _tabController.index == 0
                            ? Color(widget.colorVal)
                            : Colors.grey),
                  ),
                ),
                Tab(
                  child: Text(
                    'Week',
                    style: TextStyle(
                        color: _tabController.index == 1
                            ? Color(widget.colorVal)
                            : Colors.grey),
                  ),
                ),
                Tab(
                  child: Text(
                    'Month',
                    style: TextStyle(
                        color: _tabController.index == 2
                            ? Color(widget.colorVal)
                            : Colors.grey),
                  ),
                ),
                Tab(
                  child: Text(
                    'Year',
                    style: TextStyle(
                        color: _tabController.index == 3
                            ? Color(widget.colorVal)
                            : Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              //ExpenseDayTabs(),
              //Expense
            ],
          )),
    );
  }
}
