import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/entypo.dart';
import 'package:flutter_icons/octicons.dart';
import 'package:store_administration/create_staff.dart';
import 'package:store_administration/staff_profile_screen.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

import 'env.dart';

class ListStaffScreen extends StatefulWidget {
  @override
  _ListStaffScreenState createState() => _ListStaffScreenState();
}

class _ListStaffScreenState extends State<ListStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Staff List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: ListView(
        children: <Widget>[
          DropdownButton<String>(
            hint: Text(''),
            items: <String>['name', 'category', 'created at', 'updated at']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: '',
                child: Text(''),
              );
            }).toList(),
            onChanged: (selected) {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => StaffProfile(),
                    ),
                  );
                },
                child: Card(
                  color: blackColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    'https://cdn1.i-scmp.com/sites/default/files/styles/1200x800/public/images/methode/2019/01/16/07a7ab2a-17ce-11e9-8ff8-c80f5203e5c9_image_hires_160333.jpg?itok=Wjo1J4Gs&v=1547625814',
                                    height:
                                        Environment().getHeight(height: 3.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AutoSizeText(
                                        'Te Sonita (Jennie)',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        minFontSize: 20.0,
                                        maxFontSize: 128.0,
                                      ),
                                      AutoSizeText(
                                        'Stock Manager',
                                        style: TextStyle(color: Colors.grey),
                                        minFontSize: 18.0,
                                        maxFontSize: 128.0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: AutoSizeText(
                                          '098 865 551',
                                          style: TextStyle(color: Colors.white),
                                          minFontSize: 18.0,
                                          maxFontSize: 128.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: whiteColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'Created at: 20/09/2019',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: whiteColor,
        child: Icon(
          Icons.add,
          color: blackColor,
          size: 40.0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CreateStaffScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
