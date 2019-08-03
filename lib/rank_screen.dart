import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

class RankingScreen extends StatefulWidget {
  @override
  _RankBottomBarState createState() => _RankBottomBarState();
}

class _RankBottomBarState extends State<RankingScreen> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> _contatos = List.generate(_count, (int i) => AddRank());
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: AutoSizeText('Ranking'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: AutoSizeText(
                          'Experience',
                          style: TextStyle(
                            color: whiteColor,
                          ),
                          minFontSize: 16.0,
                          maxFontSize: 128.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: AutoSizeText(
                          'Salary',
                          style: TextStyle(
                            color: whiteColor,
                          ),
                          minFontSize: 16.0,
                          maxFontSize: 128.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            AutoSizeText(
                              '0',
                              style: TextStyle(
                                color: whiteColor,
                              ),
                              minFontSize: 16.0,
                              maxFontSize: 128.0,
                            ),
                            AutoSizeText(
                              ' - ',
                              style: TextStyle(
                                color: whiteColor,
                              ),
                              minFontSize: 16.0,
                              maxFontSize: 128.0,
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 16.0, 8.0),
                                child: AutoSizeText(
                                  '50',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    32.0, 8.0, 32.0, 8.0),
                                child: AutoSizeText(
                                  '7\$/h',
                                ),
                              ),
                            ),
                            IconButton(
                              color: confirmColor,
                              iconSize: 25.0,
                              icon: Icon(Icons.add),
                              onPressed: _addNewRank,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: _contatos,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _addNewRank() {
    setState(() {
      _count = _count + 1;
    });
  }
}

class AddRank extends StatefulWidget {
  const AddRank({
    Key key,
  }) : super(key: key);

  @override
  _AddRankState createState() => _AddRankState();
}

class _AddRankState extends State<AddRank> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AutoSizeText(
                    '0',
                    style: TextStyle(
                      color: whiteColor,
                    ),
                    minFontSize: 16.0,
                    maxFontSize: 128.0,
                  ),
                  AutoSizeText(
                    ' - ',
                    style: TextStyle(
                      color: whiteColor,
                    ),
                    minFontSize: 16.0,
                    maxFontSize: 128.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      child: AutoSizeText('50'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                      child: Text('7\$/h'),
                    ),
                  ),
                  IconButton(
                    color: removeColor,
                    icon: Icon(Icons.clear),
                    onPressed: _removeRankCount,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeRankCount() {
    return setState(() {
      _count = _count--;
    });
  }
}
