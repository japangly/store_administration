import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/octicons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:store_administration/edit_staff.dart';
import 'package:store_administration/set_price_inventory.dart';
import 'package:store_administration/staff_profile_screen.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

import 'dialogs/delete_dialog.dart';
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
          Card(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://assets.nst.com.my/images/articles/olslisbpbd001a_1553661995.jpg',
                                      height:
                                          Environment().getHeight(height: 3.0),
                                      width: Environment().getWidth(width: 6.0),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        AutoSizeText(
                                          'Irene (Nita)',
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          minFontSize: 20.0,
                                          maxFontSize: 128.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Center(
                                              child: AutoSizeText(
                                                'Stock Manager',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                                minFontSize: 18.0,
                                                maxFontSize: 128.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50.0),
                                              child: AutoSizeText(
                                                '\$500.00',
                                                style: TextStyle(
                                                    color: Colors.white),
                                                minFontSize: 20.0,
                                                maxFontSize: 128.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: AutoSizeText(
                                            '098 865 551',
                                            style:
                                                TextStyle(color: Colors.white),
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
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.grey,
                      icon: Icons.edit,
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => EditStaffScreen())),
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
          ),
        ],
      ),
    );
  }
}
