import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/octicons.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recase/recase.dart';

import 'Functions/firestore.dart';
import 'env.dart';
import 'themes/helpers/fonts.dart';
import 'themes/helpers/theme_colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key key, @required this.document}) : super(key: key);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    bool _isLoadingState = false;
    return ModalProgressHUD(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0c0c0c),
            centerTitle: true,
            title: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Product Details',
                    style: font20White,
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        document.data['image'],
                        height: Environment().getHeight(height: 10.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ReCase(document.data['name']).titleCase,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: blackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ReCase(document.data['category']).camelCase,
                          style: font15Grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Octicons.getIconData("primitive-dot"),
                            color: Colors.green[500],
                          ),
                          Text(
                            'In Stock: ${document.data['in_stock']}',
                            style: TextStyle(
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Octicons.getIconData("primitive-dot"),
                            color: Colors.orange[500],
                          ),
                          Text(
                            'In Use: ${document.data['in_use']}',
                            style: TextStyle(
                              color: Colors.orange[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    margin:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                    child: Divider(
                      color: Colors.black,
                      height: 10,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Text(
                    'Description',
                    style: font20Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(document.data['description']),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Created at: ${DateFormat("dd/MM/y").format(document.data['created_at'].toDate()).toString()}',
                            style: TextStyle(color: Colors.blue[500]),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Updated at: ${DateFormat("dd/MM/y").format(document.data['updated_at'].toDate()).toString()}',
                            style: TextStyle(color: Colors.green[500]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: FutureBuilder(
                    future: DatabaseFirestore()
                        .getUserCreatedProduct(userId: document.data['uid']),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot == null) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          return snapshot == null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('By: '),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        'By: ${snapshot.data.documents.first.data['first_name']} ${snapshot.data.documents.first.data['last_name']}'),
                                  ],
                                );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      inAsyncCall: _isLoadingState,
      progressIndicator: CircularProgressIndicator(),
    );
  }
}
