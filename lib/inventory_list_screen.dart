import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/octicons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recase/recase.dart';
import 'package:store_administration/Functions/firestore.dart';
import 'package:store_administration/product_details.dart';
import 'package:store_administration/set_price_inventory.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

import 'dialogs/delete_dialog.dart';
import 'env.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Inventory',
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
          StreamBuilder<QuerySnapshot>(
              stream: DatabaseFirestore().getStreamCollection(
                  collection: 'products', orderBy: 'name', isDescending: false),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                print('snapshot data ${snapshot.data.documents.length}');
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
                        : new ListProducts(
                            snapshot: snapshot,
                          );
                }
              }),
        ],
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    Key key,
    @required this.snapshot,
  }) : super(key: key);
  final AsyncSnapshot<QuerySnapshot> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: snapshot.data.documents.map((DocumentSnapshot document) {
        return Card(
          child: Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductDetails(
                      document: document,
                    ),
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
                                    document.data['image'],
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
                                        ReCase(document.data['name']).titleCase,
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        minFontSize: 20.0,
                                        maxFontSize: 128.0,
                                      ),
                                      AutoSizeText(
                                        ReCase(document.data['category'])
                                            .camelCase,
                                        style: TextStyle(color: Colors.grey),
                                        minFontSize: 18.0,
                                        maxFontSize: 128.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                AutoSizeText(
                                  ReCase('stock').titleCase,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minFontSize: 15.0,
                                  maxFontSize: 128.0,
                                ),
                                AutoSizeText(
                                  document.data['in_stock'].toString(),
                                  style: TextStyle(
                                    color: Colors.green[500],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minFontSize: 20.0,
                                  maxFontSize: 128.0,
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
                                Icon(
                                  Octicons.getIconData('primitive-dot'),
                                  color: Colors.green[500],
                                ),
                                AutoSizeText(
                                  'Price In: \$${document.data['buy_price']}',
                                  style: TextStyle(
                                    color: Colors.green[500],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minFontSize: 15.0,
                                  maxFontSize: 128.0,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Octicons.getIconData('primitive-dot'),
                                  color: Colors.orange[500],
                                ),
                                AutoSizeText(
                                  'Price Out: \$${document.data['sell_price']}',
                                  style: TextStyle(
                                      color: Colors.orange[500],
                                      fontWeight: FontWeight.bold),
                                  minFontSize: 15.0,
                                  maxFontSize: 128.0,
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
                    caption: 'Set Price',
                    color: Colors.grey,
                    icon: Icons.attach_money,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SetPriceInventoryScreen())),
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
        );
      }).toList(),
    );
  }
}
