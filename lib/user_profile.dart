import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Functions/authentication.dart';
import 'Functions/firestore.dart';
import 'change_password.dart';
import 'env.dart';
import 'log_in_screen.dart';
import 'themes/helpers/fonts.dart';
import 'themes/helpers/theme_colors.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  SharedPreferences sharedPreferences;
  String uid;

  bool _loadingState = false;

  @override
  void initState() {
    super.initState();
    _getSharePreference();
  }

  Future _getSharePreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
    uid = sharedPreferences.getString('uid');
  }

  Future _signOut(BuildContext context) async {
    setState(() {
      _loadingState = true;
    });
    await Authentication().signOut().whenComplete(() {
      sharedPreferences.clear();
      setState(() {
        _loadingState = false;
      });
    }).whenComplete(() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ChangePasswordScreen();
                  },
                ),
              );
            },
          ),
        ],
        title: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('Profile'),
            ),
          ],
        ),
      ),
      body: ModalProgressHUD(
        child: FutureBuilder<QuerySnapshot>(
            future: DatabaseFirestore().getCurrentUserInfo(),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return snapshot.data == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: <Widget>[
                        Expanded(
                            child: ListView(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 15.0),
                                  child: Center(
                                    child: Container(
                                      width: Environment().getHeight(height: 8),
                                      height:
                                          Environment().getHeight(height: 8),
                                      child: CircleAvatar(
                                        minRadius:
                                            Environment().getHeight(height: 3),
                                        maxRadius:
                                            Environment().getHeight(height: 3),
                                        backgroundImage: NetworkImage(
                                          snapshot.data.documents.first
                                              .data['image'],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      ReCase(snapshot.data.documents.first
                                                  .data['first_name'] +
                                              ' ' +
                                              snapshot.data.documents.first
                                                  .data['last_name'])
                                          .titleCase,
                                      style: font20Black,
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        ReCase(snapshot.data.documents.first
                                                .data['role'])
                                            .titleCase,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  title: Text(
                                    ReCase('phone number').titleCase,
                                    style: font15Grey,
                                  ),
                                  trailing: Text(
                                      snapshot.data.documents.first
                                          .data['phone_number'],
                                      style: font15Black),
                                ),
                                ListTile(
                                  title: Text(
                                    ReCase('email').titleCase,
                                    style: font15Grey,
                                  ),
                                  trailing: Text(
                                      snapshot
                                          .data.documents.first.data['email']
                                          .toString()
                                          .toLowerCase(),
                                      style: font15Black),
                                ),
                                ListTile(
                                  title: Text(
                                    'Birthday',
                                    style: font15Grey,
                                  ),
                                  trailing: Text(
                                      ReCase(
                                        DateFormat('d MMMM y')
                                            .format(
                                              snapshot.data.documents.first
                                                  .data['date_of_birth']
                                                  .toDate(),
                                            )
                                            .toString(),
                                      ).titleCase,
                                      style: font15Black),
                                ),
                                ListTile(
                                  title: Text(
                                    ReCase('place of birth').titleCase,
                                    style: font15Grey,
                                  ),
                                  trailing: Text(
                                      ReCase(snapshot.data.documents.first
                                              .data['place_of_birth'])
                                          .titleCase,
                                      style: font15Black),
                                ),
                                ListTile(
                                  title: Text(
                                    ReCase('address').titleCase,
                                    style: font15Grey,
                                  ),
                                  trailing: Text(
                                      ReCase(snapshot.data.documents.first
                                              .data['address'])
                                          .titleCase,
                                      style: font15Black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          )),
                                          textColor: Colors.white,
                                          color: blackColor,
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text('Sign Out'),
                                          onPressed: () async {
                                            await _signOut(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                      ],
                    );
              // }
              // switch (snapshot.connectionState) {
              //   case ConnectionState.waiting:

              // }
            }),
        inAsyncCall: _loadingState,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }
}
