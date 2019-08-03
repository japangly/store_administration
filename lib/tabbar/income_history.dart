import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../themes/helpers/theme_colors.dart';

class IncomeHistoryTab extends StatefulWidget {
  @override
  _IncomeHistoryTabState createState() => _IncomeHistoryTabState();
}

class _IncomeHistoryTabState extends State<IncomeHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ServiceHistoryCard(),
        ServiceHistoryCard(),
        ServiceHistoryCard(),
        ItemHistoryCard(),
      ],
    );
  }
}

class ItemHistoryCard extends StatefulWidget {
  @override
  _ItemHistoryCardState createState() => _ItemHistoryCardState();
}

class _ItemHistoryCardState extends State<ItemHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: blackColor,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AutoSizeText(
                                        'Item Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: whiteColor),
                                        minFontSize: 20.0,
                                        maxFontSize: 256.0,
                                      ),
                                      AutoSizeText(
                                        'Shampoo',
                                        style: TextStyle(color: Colors.grey),
                                        minFontSize: 8.0,
                                        maxFontSize: 256.0,
                                      ),
                                    ],
                                  ),
                                ),
                                AutoSizeText(
                                  '\$ 250',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: confirmColor,
                                  ),
                                  minFontSize: 20.0,
                                  maxFontSize: 256.0,
                                ),
                              ],
                            ),
                            Divider(
                              color: cancelColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Date',
                                      minFontSize: 8.0,
                                      maxFontSize: 128.0,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        '29/12/1997',
                                        minFontSize: 8.0,
                                        maxFontSize: 128.0,
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      'By',
                                      minFontSize: 8.0,
                                      maxFontSize: 128.0,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: AutoSizeText(
                                            'OMG',
                                            style: TextStyle(color: whiteColor),
                                            minFontSize: 8.0,
                                            maxFontSize: 128.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Action',
                                      minFontSize: 8.0,
                                      maxFontSize: 128.0,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        'Sale',
                                        style: TextStyle(color: whiteColor),
                                        minFontSize: 8.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 35.0,
              width: 35.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(128.0),
                  ),
                ),
                color: confirmColor,
                // color: equalsIgnoreCase(action, 'created')
                //     ? listColor.elementAt(1)
                //     : listColor.elementAt(0),
                elevation: 6.0,
                child: Icon(Icons.add),
                // child: equalsIgnoreCase(action, 'created')
                //     ? listIcon.elementAt(1)
                //     : listIcon.elementAt(0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ServiceHistoryCard extends StatefulWidget {
  @override
  _ServiceHistoryCardState createState() => _ServiceHistoryCardState();
}

class _ServiceHistoryCardState extends State<ServiceHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: blackColor,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AutoSizeText(
                                    'Name Service',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor),
                                    minFontSize: 20.0,
                                    maxFontSize: 256.0,
                                  ),
                                ),
                                AutoSizeText(
                                  '\$ 250',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: confirmColor,
                                  ),
                                  minFontSize: 20.0,
                                  maxFontSize: 256.0,
                                ),
                              ],
                            ),
                            Divider(
                              color: cancelColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Date',
                                      minFontSize: 8.0,
                                      maxFontSize: 128.0,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        '29/12/1997',
                                        minFontSize: 8.0,
                                        maxFontSize: 128.0,
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      'By',
                                      minFontSize: 8.0,
                                      maxFontSize: 128.0,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: AutoSizeText(
                                            'OMG',
                                            style: TextStyle(color: whiteColor),
                                            minFontSize: 8.0,
                                            maxFontSize: 128.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Action',
                                      minFontSize: 8.0,
                                      maxFontSize: 128.0,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        'Services',
                                        style: TextStyle(color: whiteColor),
                                        minFontSize: 8.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 35.0,
              width: 35.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(128.0),
                  ),
                ),
                color: confirmColor,
                // color: equalsIgnoreCase(action, 'created')
                //     ? listColor.elementAt(1)
                //     : listColor.elementAt(0),
                elevation: 6.0,
                child: Icon(Icons.content_cut),
                // child: equalsIgnoreCase(action, 'created')
                //     ? listIcon.elementAt(1)
                //     : listIcon.elementAt(0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class IncomeHeadTab extends StatefulWidget {
  const IncomeHeadTab({
    Key key,
  }) : super(key: key);

  @override
  _IncomeHeadTabState createState() => _IncomeHeadTabState();
}

class _IncomeHeadTabState extends State<IncomeHeadTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: <Widget>[
                AutoSizeText(
                  'Income Today   ',
                  style: TextStyle(
                      color: confirmColor, fontWeight: FontWeight.normal),
                  minFontSize: 16.0,
                ),
                Icon(
                  Icons.arrow_upward,
                  color: confirmColor,
                )
              ],
            ),
          ),
          AutoSizeText(
            '\$ 250',
            style: TextStyle(color: confirmColor, fontWeight: FontWeight.bold),
            minFontSize: 64.0,
          ),
        ],
      ),
    );
  }
}
