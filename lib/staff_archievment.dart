import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'themes/helpers/theme_colors.dart';

class StaffAchievement extends StatefulWidget {
  @override
  _StaffAchievementState createState() => _StaffAchievementState();
}

class _StaffAchievementState extends State<StaffAchievement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Staff Achievement'),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
            child: AutoSizeText(
              '32/13/2991',
              style: TextStyle(
                color: whiteColor,
              ),
              minFontSize: 16.0,
              maxFontSize: 128.0,
            ),
          ),
          SingleChildScrollView(
            child: Card(
              color: blackColor,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 12.0, 12.0, 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ItemAchivement(),
                    ItemAchivement(),
                    ItemAchivement(),
                    ServiceAchievement(),
                    ServiceAchievement(),
                    ServiceAchievement(),
                    ServiceAchievement(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceAchievement extends StatelessWidget {
  const ServiceAchievement({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.content_cut,
              color: whiteColor,
            ),
          ),
          Expanded(
            child: AutoSizeText(
              'Services Name:',
              style: TextStyle(
                color: whiteColor,
              ),
              minFontSize: 16.0,
              maxFontSize: 128.0,
            ),
          ),
          Expanded(
            child: Center(
              child: AutoSizeText(
                '3',
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
    );
  }
}

class ItemAchivement extends StatelessWidget {
  const ItemAchivement({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.add_shopping_cart,
              color: whiteColor,
            ),
          ),
          Expanded(
            child: AutoSizeText(
              'Item Name:',
              style: TextStyle(
                color: whiteColor,
              ),
              minFontSize: 16.0,
              maxFontSize: 128.0,
            ),
          ),
          Expanded(
            child: Center(
              child: AutoSizeText(
                '25',
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
    );
  }
}
