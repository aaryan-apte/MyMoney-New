// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_money/pages/home_pages/home_page.dart';

import 'income_pages/incomedaytab.dart';
import 'income_pages/incomemonthtab.dart';
import 'income_pages/incomeweektab.dart';
import 'income_pages/incomeyeartab.dart';
/*import 'package:my_money/pages/login.dart';
import 'package:my_money/pages/signup/home1.dart';
import 'package:my_money/pages/signup/register.dart';
import 'package:my_money/pages/signup/input.dart';
import 'package:my_money/pages/homepage/home_page.dart';*/

class IncomeTopTabs extends StatefulWidget {
  IncomeTopTabs(this.colorVal);
  int colorVal;

  @override
  _IncomeTopTabsState createState() => _IncomeTopTabsState();
}

class _IncomeTopTabsState extends State<IncomeTopTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabSelector = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  //sets the color for next tabs too
  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xffe91e63;
    });
  }

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
          children: [
            IncomeDayTab(),
            IncomeWeekTab(),
            IncomeMonthTab(),
            IncomeYearTab(),
          ],
        ),
      ),
    );
  }
}
