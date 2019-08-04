import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

class RankingScreen extends StatefulWidget {
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: AutoSizeText('Ranking'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
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
            Expanded(
              child: ListView(
                children: <Widget>[
                  RankingCard(),
                  RankingCard(),
                  RankingCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RankingCard extends StatefulWidget {
  const RankingCard({
    Key key,
  }) : super(key: key);

  @override
  _RankingCardState createState() => _RankingCardState();
}

class _RankingCardState extends State<RankingCard> {
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
                  Flexible(
                    child: AutoSizeText(
                      '0',
                      style: TextStyle(
                        color: whiteColor,
                      ),
                      minFontSize: 16.0,
                      maxFontSize: 128.0,
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      ' - ',
                      style: TextStyle(
                        color: whiteColor,
                      ),
                      minFontSize: 16.0,
                      maxFontSize: 128.0,
                    ),
                  ),
                  Flexible(
                    child: Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '50',
                            border: UnderlineInputBorder(),
                          ),
                        ),
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
                  Flexible(
                    child: Container(),
                  ),
                  Flexible(
                    flex: 2,
                    child: Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '7\$/h',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
