import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:store_administration/print_instock_history.dart';
import 'package:store_administration/print_inused.dart';
import 'package:store_administration/tabbar/income_history.dart';
import 'package:store_administration/tabbar/stock_tab_history.dart';
import 'package:store_administration/tabbar/used_tab.dart';

import 'print_income_history.dart';
import 'themes/helpers/theme_colors.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

final List<Widget> screenBodyTabs = [
  IncomeHistoryTab(),
  StockHistoryTab(),
  UsedHistoryTab(),
];
final List<Widget> screenHeadTabs = [
  IncomeHeadTab(),
  StockHeadTab(),
  UsedHeadTab(),
];
TabController _tabController;

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        backgroundColor: Color(0xFF3b3b3b),
        appBar: AppBar(
          elevation: 4.0,
          backgroundColor: Color(0xFF0c0c0c),
          title: Text(
            'History',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(2019, 1, 1),
                      onConfirm: (date) {
                        print('confirm $date');
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    elevation: 5.0,
                    color: blackColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              'Date',
                              style: TextStyle(
                                color: whiteColor,
                              ),
                              minFontSize: 16.0,
                              maxFontSize: 128.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              SimpleLineIcons.getIconData('calendar'),
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  screenHeadTabs[0],
                  screenHeadTabs[1],
                  screenHeadTabs[2],
                ],
              ),
            ),
            Flexible(
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicator: MD2Indicator(
                    indicatorHeight: 2.0,
                    indicatorColor: Colors.black,
                    indicatorSize: MD2IndicatorSize.tiny),
                tabs: <Widget>[
                  Tab(
                    text: 'Income',
                  ),
                  Tab(
                    text: 'Stock',
                  ),
                  Tab(
                    text: 'Used',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  screenBodyTabs[0],
                  screenBodyTabs[1],
                  screenBodyTabs[2],
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: _bottomButtons(),
      ),
      length: 3,
    );
  }

  dynamic _bottomButtons() {
    print(_tabController.index);
    switch (_tabController.index) {
      case 0:
        return FloatingActionButton.extended(
          label: Column(
            children: <Widget>[
              Icon(Icons.print),
              AutoSizeText('Income'),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PrintIncome(),
              ),
            );
          },
        );
        break;
      case 1:
        return FloatingActionButton.extended(
          label: Column(
            children: <Widget>[
              Icon(Icons.print),
              AutoSizeText('Instock'),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PrintInStock(),
              ),
            );
          },
        );
        break;
      case 2:
        return FloatingActionButton.extended(
          label: Column(
            children: <Widget>[
              Icon(Icons.print),
              AutoSizeText('Inused'),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PrintInused(),
              ),
            );
          },
        );
        break;
      default:
    }
  }
}
