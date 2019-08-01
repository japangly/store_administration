import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

class StaffSalary extends StatefulWidget {
  @override
  _StaffSalaryState createState() => _StaffSalaryState();
}

double _value2 = 0.0;
double _value3 = 0.0;

class _StaffSalaryState extends State<StaffSalary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text('Salary'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            AutoSizeText(
                              'Formula',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.normal,
                              ),
                              minFontSize: 24.0,
                              maxFontSize: 128.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                'Salary = ( Salary/hour x Hours ) + Bonus + OT',
                                style: TextStyle(
                                  color: whiteColor,
                                ),
                                minFontSize: 15.0,
                                maxFontSize: 128.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                'Salary Hour',
                minFontSize: 18.0,
                maxFontSize: 128.0,
                style: TextStyle(
                  color: whiteColor,
                ),
              ),
            ),
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: FluidSlider(
                start: Icon(
                  Icons.remove,
                  color: whiteColor,
                ),
                end: Icon(
                  Icons.add,
                  color: whiteColor,
                ),
                sliderColor: blackColor,
                value: _value2,
                onChanged: (double newValue2) {
                  setState(() {
                    _value2 = newValue2;
                  });
                },
                min: 0.0,
                max: 300.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                'Over-Time Hour',
                minFontSize: 18.0,
                maxFontSize: 128.0,
                style: TextStyle(
                  color: whiteColor,
                ),
              ),
            ),
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: FluidSlider(
                start: Icon(
                  Icons.remove,
                  color: whiteColor,
                ),
                end: Icon(
                  Icons.add,
                  color: whiteColor,
                ),
                sliderColor: blackColor,
                value: _value3,
                onChanged: (double newValue3) {
                  setState(() {
                    _value3 = newValue3;
                  });
                },
                min: 0.0,
                max: 52.0,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          'Salary',
                          minFontSize: 18.0,
                          maxFontSize: 128.0,
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
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
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          'Salary Over-Time',
                          minFontSize: 18.0,
                          maxFontSize: 128.0,
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
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
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 16.0),
              child: RaisedButton(
                color: blackColor,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        'SAVE',
                        style: TextStyle(
                          color: whiteColor,
                        ),
                        minFontSize: 20.0,
                        maxFontSize: 128.0,
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
