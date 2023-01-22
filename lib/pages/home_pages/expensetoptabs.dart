// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_money/pages/home_pages/home_page.dart';
import 'package:masonry_grid/masonry_grid.dart';
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

  @override
  Widget build(BuildContext context) {
    int amount_day = 25000;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Tab bar',
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
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
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Day',
                  ),

                  // second tab [you can add an icon using the icon property]
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
            // tab bar view here
            Expanded(
              child: Column(
                // controller: _tabController,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  // first tab bar view widget
                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: 100.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'You\'ve spent ₹$amount_day',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //
                  // MasonryGridView.count(
                  //   crossAxisCount: 1,
                  //   mainAxisSpacing: 7,
                  //   crossAxisSpacing: 10,
                  //   itemBuilder: (context, index) => Container(
                  //       height: 295,
                  //       width: 100,
                  //       color: Colors.white,
                  //       child: Column(
                  //         children: <Widget>[
                  //           Padding(
                  //             padding: EdgeInsets.all(8),
                  //             child: Center(
                  //               child: Text(
                  //                 products[index].title!,
                  //                 style: const TextStyle(
                  //                     fontFamily: 'PlusJakartaSans',
                  //                     fontWeight: FontWeight.w600,
                  //                     fontSize: 13),
                  //                 textAlign: TextAlign.center,
                  //               ),
                  //             ),
                  //           ),
                  //
                  //           Padding(
                  //             padding: const EdgeInsets.all(10),
                  //             child: Image(
                  //               image: NetworkImage(products[index].image!),
                  //               height: 100,
                  //               width: 100,
                  //             ),
                  //           ),
                  //
                  //           Padding(
                  //             padding: EdgeInsets.all(15),
                  //             child: Text('\$' + products[index].price!),
                  //           ),
                  //
                  //           // Text(products[index].rating!.toString()),
                  //           // SizedBox(height: 8)
                  //
                  //           if (products[index].rating != null)
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 color: Colors.green,
                  //                 borderRadius: BorderRadius.circular(12),
                  //               ),
                  //               padding: const EdgeInsets.symmetric(
                  //                   horizontal: 4, vertical: 2),
                  //               child: Row(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 children: [
                  //                   Text(
                  //                     products[index].rating!.rate!,
                  //                     style:
                  //                         const TextStyle(color: Colors.white),
                  //                   ),
                  //                   const Icon(
                  //                     Icons.star,
                  //                     size: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //         ],
                  //       )),
                  //   itemCount: products.length,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
