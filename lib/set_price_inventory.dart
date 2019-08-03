import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

class SetPriceInventoryScreen extends StatefulWidget {
  @override
  _SetPriceInventoryScreenState createState() =>
      _SetPriceInventoryScreenState();
}

class _SetPriceInventoryScreenState extends State<SetPriceInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Set Price',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: AutoSizeText(
                  'Sunsilk',
                  style: TextStyle(
                    color: blackColor,
                  ),
                  minFontSize: 30.0,
                  maxFontSize: 128.0,
                ),
              ),
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Price In',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Price Out',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      )),
                      textColor: Colors.white,
                      color: Colors.black,
                      padding: const EdgeInsets.all(16.0),
                      child: new Text(
                        ('Set'),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
