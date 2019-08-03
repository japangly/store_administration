import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/simple_line_icons.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:store_administration/dialogs/dialog_print_inuse.dart';

import 'themes/helpers/buttons.dart';
import 'themes/helpers/fonts.dart';
import 'themes/helpers/theme_colors.dart';

class PrintInused extends StatefulWidget {
  @override
  _PrintInusedState createState() => _PrintInusedState();
}

class _PrintInusedState extends State<PrintInused> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFF3b3b3b),
        appBar: AppBar(
          elevation: 4.0,
          backgroundColor: Color(0xFF0c0c0c),
          title: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  ReCase('Inused').titleCase,
                  style: font20White,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    SimpleLineIcons.getIconData('printer'),
                    color: blackColor,
                    size: 60.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      ReCase('choose a date!').titleCase,
                      style: TextStyle(fontSize: 20, color: whiteColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2019, 1, 1),
                                onConfirm: (date) async {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return PrintDialogInused(
                                      dateTime: date,
                                      selectedDate: ReCase(
                                              DateFormat('yMMMMEEEEd')
                                                  .format(date)
                                                  .toString())
                                          .titleCase,
                                    );
                                  });
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          textButton: ReCase('another day').titleCase,
                          colorButton: cancelColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomButton(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return PrintDialogInused(
                                    dateTime: DateTime.now(),
                                    selectedDate: ReCase(
                                            DateFormat('yMMMMEEEEd')
                                                .format(DateTime.now())
                                                .toString())
                                        .titleCase,
                                  );
                                });
                          },
                          textButton: ReCase('today').titleCase,
                          colorButton: blackColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
