import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart'
    as prefix0;
import 'themes/helpers/theme_colors.dart';

class SuccessResetScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

TextEditingController phoneTextController = TextEditingController();

class _LoginState extends State<SuccessResetScreen> {
  String phoneNumber;
  bool validatePhoneNumber;
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Successful password reset!',
                  style: TextStyle(
                      fontFamily: 'Realistica',
                      fontSize: 20.0,
                      color: prefix0.blackColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
                  child: Text(
                    'You can now use your new password to log in to your account!',
                    style: TextStyle(fontSize: 15.0, color: blackColor),
                    textAlign: TextAlign.center,
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
                          color: prefix0.blackColor,
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                "Login",
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                          onPressed: () {},
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
    );
  }
}
