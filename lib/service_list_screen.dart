import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:store_administration/edit_service.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'create_service.dart';
import 'dialogs/delete_dialog.dart';

class ListServiceScreen extends StatefulWidget {
  @override
  _ListServiceScreenState createState() => _ListServiceScreenState();
}

String _selectedNameStaff = 'Ok';
List<String> _listNameStaff = ['create At', 'Desc', 'Upper'];

class _ListServiceScreenState extends State<ListServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Service List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                child: Card(
                  color: blackColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                    child: DropdownButton<String>(
                      hint: AutoSizeText(
                        _selectedNameStaff,
                        minFontSize: 12.0,
                        style: TextStyle(color: whiteColor),
                      ),
                      items: _listNameStaff.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: AutoSizeText(
                            value,
                            minFontSize: 12.0,
                          ),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          _selectedNameStaff = selected;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            child: Container(
              child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Container(
                  color: blackColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                AutoSizeText(
                                  'Nail Cut',
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minFontSize: 20.0,
                                  maxFontSize: 128.0,
                                ),
                                AutoSizeText(
                                  '\$10.00',
                                  style: TextStyle(
                                    color: whiteColor,
                                  ),
                                  minFontSize: 30.0,
                                  maxFontSize: 128.0,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey,
                                      ),
                                      AutoSizeText(
                                        '20min',
                                        style: TextStyle(color: Colors.grey),
                                        minFontSize: 18.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.add,
                                        color: Colors.greenAccent,
                                      ),
                                      AutoSizeText(
                                        '5%',
                                        style: TextStyle(
                                            color: Colors.greenAccent),
                                        minFontSize: 20.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  AutoSizeText(
                                    '20',
                                    style: TextStyle(color: Colors.amber),
                                    minFontSize: 18.0,
                                    maxFontSize: 128.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Edit',
                    color: Colors.grey,
                    icon: Icons.edit,
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => EditServiceScreen())),
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Container(
                  color: blackColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                AutoSizeText(
                                  'Nail Cut',
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minFontSize: 20.0,
                                  maxFontSize: 128.0,
                                ),
                                AutoSizeText(
                                  '\$10.00',
                                  style: TextStyle(
                                    color: whiteColor,
                                  ),
                                  minFontSize: 30.0,
                                  maxFontSize: 128.0,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.grey,
                                      ),
                                      AutoSizeText(
                                        '20min',
                                        style: TextStyle(color: Colors.grey),
                                        minFontSize: 18.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.add,
                                        color: Colors.greenAccent,
                                      ),
                                      AutoSizeText(
                                        '5%',
                                        style: TextStyle(
                                            color: Colors.greenAccent),
                                        minFontSize: 20.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  AutoSizeText(
                                    '20',
                                    style: TextStyle(color: Colors.amber),
                                    minFontSize: 18.0,
                                    maxFontSize: 128.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Edit',
                    color: Colors.grey,
                    icon: Icons.edit,
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => EditServiceScreen())),
                  ),
                  IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return DeleteDialog(
                                deleteCallBack: () {},
                              );
                            });
                      }),
                ],
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
                return CreateServiceScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
