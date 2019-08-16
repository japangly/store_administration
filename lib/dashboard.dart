import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'Functions/firestore.dart';
import 'history_screen.dart';
import 'inventory_list_screen.dart';
import 'rank_screen.dart';
import 'service_list_screen.dart';
import 'staff_list_screen.dart';
import 'themes/helpers/theme_colors.dart';
import 'user_profile.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isInventoryLoading = false;

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        color: Color(0xFF0c0c0c),
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF3b3b3b),
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Color(0xFF0c0c0c),
          title: Text('Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              )),
          leading: IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return UserProfile();
                  },
                ),
              );
            },
          ),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          StreamBuilder<QuerySnapshot>(
                              stream: DatabaseFirestore().getStreamCollection(
                                collection: 'employees',
                                orderBy: 'first_name',
                                isDescending: false,
                              ),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0)),
                                  );
                                }
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  default:
                                    return snapshot.data == null
                                        ? Column(
                                            children: <Widget>[
                                              Text('0',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 25.0)),
                                              Text('Staff',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12.0)),
                                            ],
                                          )
                                        : Column(
                                            children: <Widget>[
                                              Text(
                                                  '${snapshot.data.documents.length}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 25.0)),
                                              Text('Staff',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12.0)),
                                            ],
                                          );
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: null,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0)),
                                  );
                                }
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  default:
                                    return snapshot.data == null
                                        ? Column(
                                            children: <Widget>[
                                              Text('\$0',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 25.0)),
                                              Text('Expense on Salary',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12.0)),
                                            ],
                                          )
                                        : Column(
                                            children: <Widget>[
                                              Text('\$500',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 25.0)),
                                              Text('Expense on Salary',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12.0)),
                                            ],
                                          );
                                }
                              }),
                        ],
                      ),
                      Material(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.people,
                                color: Colors.white, size: 30.0),
                          ),
                        ),
                      ),
                    ]),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ListStaffScreen())),
            ),
            _buildTile(
              ModalProgressHUD(
                child: StreamBuilder<QuerySnapshot>(
                    stream: DatabaseFirestore().getStreamCollection(
                        collection: 'products',
                        orderBy: 'name',
                        isDescending: false),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0)),
                        );
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          return Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: snapshot.data == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Material(
                                          color: Colors.blue,
                                          shape: CircleBorder(),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Icon(Icons.store,
                                                color: Colors.white,
                                                size: 30.0),
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 16.0)),
                                      Text('Inventory',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0)),
                                      Text('No Data',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0)),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                        Material(
                                            color: Colors.blue,
                                            shape: CircleBorder(),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Icon(Icons.store,
                                                  color: Colors.white,
                                                  size: 30.0),
                                            )),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 16.0)),
                                        Text('Inventory',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0)),
                                        Text(
                                            '${snapshot.data.documents.length}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0)),
                                      ]),
                          );
                      }
                    }),
                inAsyncCall: _isInventoryLoading,
                progressIndicator: CircularProgressIndicator(),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => InventoryScreen())),
            ),
            _buildTile(
              StreamBuilder<QuerySnapshot>(
                  stream: DatabaseFirestore().getStreamCollection(
                      collection: 'services',
                      orderBy: 'name',
                      isDescending: false),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0)),
                      );
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: snapshot.data == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Material(
                                          color: Colors.pinkAccent,
                                          shape: CircleBorder(),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Icon(Icons.content_cut,
                                                color: Colors.white,
                                                size: 30.0),
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 16.0)),
                                      Text('Service',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0)),
                                      Text('No Data',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0)),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                        Material(
                                            color: Colors.pinkAccent,
                                            shape: CircleBorder(),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Icon(Icons.content_cut,
                                                  color: Colors.white,
                                                  size: 30.0),
                                            )),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 16.0)),
                                        Text('Service',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0)),
                                        Text(
                                            '${snapshot.data.documents.length}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0)),
                                      ]));
                    }
                  }),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ListServiceScreen())),
            ),
            _buildTile(
              StreamBuilder<QuerySnapshot>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                              color: confirmColor,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.star,
                                    color: Colors.white, size: 30.0),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('Rank',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0)),
                        ],
                      ),
                    );
                  }),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => RankingScreen(),
                  ),
                );
              },
            ),
            _buildTile(
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                          color: Colors.amber,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.notifications,
                                color: Colors.white, size: 30.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('History',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0)),
                    ],
                  ),
                ), onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HistoryScreen(),
                ),
              );
            }),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 220.0),
            StaggeredTile.extent(1, 220.0),
            StaggeredTile.extent(1, 220.0),
            StaggeredTile.extent(1, 220.0),
            StaggeredTile.extent(1, 220.0),
          ],
        ));
  }
}
