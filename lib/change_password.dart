import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart'
    as prefix0;

import 'Functions/authentication.dart';
import 'dialogs/fail_dialog.dart';
import 'successful_change.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<ChangePasswordScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoadingState = false;
  TextEditingController _oldPassword = TextEditingController(),
      _newPassword = TextEditingController(),
      _retypePassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _oldPassword.dispose();
    _newPassword.dispose();
    _retypePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: prefix0.blackColor,
          title: Text('Setting'),
        ),
        body: ModalProgressHUD(
          child: Form(
            key: _formKey,
            child: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 100.0, right: 30.0, left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Change Password',
                        style: TextStyle(
                            fontFamily: 'Realistica',
                            fontSize: 30.0,
                            color: prefix0.blackColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Old password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: _oldPassword,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please enter your password',
                              ).sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          controller: _newPassword,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'New password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please enter your password',
                              ).sentenceCase;
                            } else if (value.length < 6) {
                              return ReCase('new password at least 6 digit')
                                  .sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: _retypePassword,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Retype new password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please enter your password',
                              ).sentenceCase;
                            } else if (value != _newPassword.text) {
                              return ReCase(
                                      'retype new password not match with new password')
                                  .sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                )),
                                textColor: Colors.white,
                                color: Colors.black,
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Text(
                                      "Change",
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                ),
                                onPressed: () async {
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isLoadingState = true;
                                    });
                                    await Authentication().signIn(
                                              email: sharedPreferences
                                                  .getString('email'),
                                              password: _oldPassword.text,
                                            ) !=
                                            null
                                        ? await Authentication().changePassword(
                                            newPassword: _newPassword.text,
                                          )
                                            ? sharedPreferences
                                                .clear()
                                                .whenComplete(() {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return SuccessChangedScreen();
                                                    },
                                                  ),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );
                                              })
                                            : showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return FailDialog();
                                                })
                                        : showDialog(
                                            context: context,
                                            builder: (_) {
                                              return FailDialog();
                                            });
                                    setState(() {
                                      _isLoadingState = false;
                                    });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return FailDialog();
                                        });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          inAsyncCall: _isLoadingState,
          progressIndicator: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
