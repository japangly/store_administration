import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:store_administration/change_password.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart'
    as prefix0;

import 'env.dart';
import 'themes/helpers/buttons.dart';
import 'themes/helpers/fonts.dart';
import 'themes/helpers/theme_colors.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefix0.blackColor,
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
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                    child: Center(
                      child: Container(
                        width: Environment().getHeight(height: 8),
                        height: Environment().getHeight(height: 8),
                        child: CircleAvatar(
                          minRadius: Environment().getHeight(height: 3),
                          maxRadius: Environment().getHeight(height: 3),
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjIECykgh1kwJjYe1ElGLeN7pim1aS-tJ3W74cXoFdX3Nru3B25g'),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'jennie',
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
                          'Stock Manager',
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
                      'Phone Number',
                      style: font15Grey,
                    ),
                    trailing: Text('098 837 493', style: font15Black),
                  ),
                  ListTile(
                    title: Text(
                      'Email',
                      style: font15Grey,
                    ),
                    trailing:
                        Text('lisainthehouse@gmail.com', style: font15Black),
                  ),
                  ListTile(
                    title: Text(
                      'Birthday',
                      style: font15Grey,
                    ),
                    trailing: Text('09/March/1998', style: font15Black),
                  ),
                  ListTile(
                    title: Text(
                      'Place of Birth',
                      style: font15Grey,
                    ),
                    trailing: Text('Phnom Penh', style: font15Black),
                  ),
                  ListTile(
                    title: Text(
                      'Address',
                      style: font15Grey,
                    ),
                    trailing: Text('Phnom Penh', style: font15Black),
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
                            onPressed: () {},
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
      ),
    );
  }
}
