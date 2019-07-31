import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:store_administration/staff_archievment.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

import 'env.dart';

class StaffProfile extends StatefulWidget {
  @override
  _StaffProfileState createState() => _StaffProfileState();
}

BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(24.0),
  topRight: Radius.circular(24.0),
);

class _StaffProfileState extends State<StaffProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.details),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://channel-korea.com/wp-content/uploads/2018/04/anoncraft.com_.jpg',
                            height: Environment().getHeight(height: 8.0),
                            width: Environment().getWidth(width: 16.0),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              'Irene',
                              minFontSize: 24.0,
                              maxFontSize: 128.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor),
                            ),
                            AutoSizeText(
                              'Kort tver ey',
                              minFontSize: 16.0,
                              maxFontSize: 128.0,
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 128.0,
                              child: Card(
                                color: blackColor,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 8.0, 8.0, 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: AutoSizeText(
                                              'Phone:',
                                              style: TextStyle(
                                                color: whiteColor,
                                              ),
                                              minFontSize: 16.0,
                                              maxFontSize: 128.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: AutoSizeText(
                                              '077999900',
                                              style: TextStyle(
                                                color: whiteColor,
                                              ),
                                              minFontSize: 16.0,
                                              maxFontSize: 128.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: AutoSizeText(
                                              'Date of Birth:',
                                              style: TextStyle(
                                                color: whiteColor,
                                              ),
                                              minFontSize: 16.0,
                                              maxFontSize: 128.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: AutoSizeText(
                                              '09/08/1997',
                                              style: TextStyle(
                                                color: whiteColor,
                                              ),
                                              minFontSize: 16.0,
                                              maxFontSize: 128.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: AutoSizeText(
                                              'Place of Birth:',
                                              style: TextStyle(
                                                color: whiteColor,
                                              ),
                                              minFontSize: 16.0,
                                              maxFontSize: 128.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: AutoSizeText(
                                              'Phnom Penh',
                                              style: TextStyle(
                                                color: whiteColor,
                                              ),
                                              minFontSize: 16.0,
                                              maxFontSize: 128.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Card(
                              color: blackColor,
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Salary',
                                      minFontSize: 16.0,
                                      maxFontSize: 128.0,
                                      style: TextStyle(
                                        color: whiteColor,
                                      ),
                                    ),
                                    AutoSizeText(
                                      '25\$',
                                      style: TextStyle(
                                        color: whiteColor,
                                      ),
                                      minFontSize: 20.0,
                                      maxFontSize: 128.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: blackColor,
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Experiene Points',
                                      style: TextStyle(
                                        color: whiteColor,
                                      ),
                                      minFontSize: 16.0,
                                      maxFontSize: 128.0,
                                    ),
                                    AutoSizeText(
                                      '250',
                                      style: TextStyle(
                                        color: whiteColor,
                                      ),
                                      minFontSize: 20.0,
                                      maxFontSize: 128.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        StaffAchievement(),
                                  ),
                                );
                              },
                              child: Card(
                                color: blackColor,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      AutoSizeText(
                                        'Achievement',
                                        style: TextStyle(
                                          color: whiteColor,
                                        ),
                                        minFontSize: 16.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: blackColor,
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Calculate Salary',
                                      style: TextStyle(
                                        color: whiteColor,
                                      ),
                                      minFontSize: 16.0,
                                      maxFontSize: 128.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            minHeight: 72.0,
            panel: _panelHistory(),
            collapsed: _panel(),
            borderRadius: radius,
          ),
        ],
      ),
    );
  }

  Widget _panel() {
    return Container(
      decoration: BoxDecoration(borderRadius: radius, color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText(
                "Salary History",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _panelHistory() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: AutoSizeText(
                      "Date",
                      minFontSize: 18.0,
                      maxFontSize: 128.0,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: AutoSizeText(
                      "Salary",
                      minFontSize: 18.0,
                      maxFontSize: 128.0,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                  _salaryList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _salaryList extends StatelessWidget {
  const _salaryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: AutoSizeText(
                "29/29/12",
                minFontSize: 18.0,
                maxFontSize: 128.0,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: AutoSizeText(
                "250\$",
                minFontSize: 18.0,
                maxFontSize: 128.0,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
