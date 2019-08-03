import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../themes/helpers/theme_colors.dart';

class UsedHistoryTab extends StatefulWidget {
  @override
  _UsedHistoryTabState createState() => _UsedHistoryTabState();
}

class _UsedHistoryTabState extends State<UsedHistoryTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UsedHistoryCard(),
        UsedHistoryCard(),
        UsedHistoryCard(),
        UsedHistoryCard(),
      ],
    );
  }
}

class UsedHistoryCard extends StatefulWidget {
  @override
  _UsedHistoryCardState createState() => _UsedHistoryCardState();
}

class _UsedHistoryCardState extends State<UsedHistoryCard> {
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
                                  '- 25',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: removeColor,
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
                                        'Add',
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
                color: removeColor,
                // color: equalsIgnoreCase(action, 'created')
                //     ? listColor.elementAt(1)
                //     : listColor.elementAt(0),
                elevation: 6.0,
                child: Icon(Icons.remove),
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

class UsedHeadTab extends StatelessWidget {
  const UsedHeadTab({
    Key key,
  }) : super(key: key);

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
                  'In-use Today   ',
                  style: TextStyle(
                      color: removeColor, fontWeight: FontWeight.normal),
                  minFontSize: 16.0,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: removeColor,
                )
              ],
            ),
          ),
          AutoSizeText(
            '- 25',
            style: TextStyle(color: removeColor, fontWeight: FontWeight.bold),
            minFontSize: 64.0,
          ),
        ],
      ),
    );
  }
}
