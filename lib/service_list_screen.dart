import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recase/recase.dart';

import 'Functions/firestore.dart';
import 'create_service.dart';
import 'edit_service.dart';
import 'themes/helpers/theme_colors.dart';

class ListServiceScreen extends StatefulWidget {
  @override
  _ListServiceScreenState createState() => _ListServiceScreenState();
}

String _selectedSortBy = 'name';
List<String> _listNameOfField = ['created_at', 'name', 'price'];

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
                child: Container(),
              ),
              Flexible(
                child: Card(
                  color: blackColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                    child: DropdownButton<String>(
                      hint: AutoSizeText(
                        _selectedSortBy,
                        minFontSize: 12.0,
                        style: TextStyle(color: whiteColor),
                      ),
                      items: _listNameOfField.map((String value) {
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
                          _selectedSortBy = selected;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          new StreamServices(),
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

class StreamServices extends StatelessWidget {
  const StreamServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: DatabaseFirestore().getStreamCollection(
            collection: 'services',
            orderBy: _selectedSortBy,
            isDescending: false),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return snapshot.data == null
                  ? Center(
                      child: Text('No Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0)),
                    )
                  : ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: snapshot.data.documents.map(
                        (DocumentSnapshot document) {
                          return Card(
                            child: Container(
                              child: Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                child: Container(
                                  color: blackColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                AutoSizeText(
                                                  ReCase(document.data['name'])
                                                      .titleCase,
                                                  style: TextStyle(
                                                    color: whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  minFontSize: 20.0,
                                                  maxFontSize: 128.0,
                                                ),
                                                AutoSizeText(
                                                  '\$${document.data['price']}.00',
                                                  style: TextStyle(
                                                    color: whiteColor,
                                                  ),
                                                  minFontSize: 30.0,
                                                  maxFontSize: 128.0,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.access_time,
                                                        color: Colors.grey,
                                                      ),
                                                      AutoSizeText(
                                                        '${document.data['estimated_time']}min',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                        minFontSize: 18.0,
                                                        maxFontSize: 128.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.add,
                                                        color:
                                                            Colors.greenAccent,
                                                      ),
                                                      AutoSizeText(
                                                        '${document.data['bonus']}%',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .greenAccent),
                                                        minFontSize: 20.0,
                                                        maxFontSize: 128.0,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  AutoSizeText(
                                                    '${document.data['point']}',
                                                    style: TextStyle(
                                                        color: Colors.amber),
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
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                EditServiceScreen())),
                                  ),
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
          }
        });
  }
}
