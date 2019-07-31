import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/octicons.dart';
import 'package:store_administration/themes/helpers/theme_colors.dart';

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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Card(
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
                                  'https://www.designyourway.net/diverse/6/uilist/2517769.jpg',
                                  height: Environment().getHeight(height: 3.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Sunsilk',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      minFontSize: 20.0,
                                      maxFontSize: 128.0,
                                    ),
                                    AutoSizeText(
                                      'shampoo',
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
                                'Stock',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 15.0,
                                maxFontSize: 128.0,
                              ),
                              AutoSizeText(
                                '200',
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
                              Text(
                                'Price In: \$10.00',
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
                                Octicons.getIconData('primitive-dot'),
                                color: Colors.orange[500],
                              ),
                              Text(
                                'Price Out: \$15.00 ',
                                style: TextStyle(
                                  color: Colors.orange[500],
                                  fontWeight: FontWeight.bold,
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
            ),
          ),
        ],
      ),
    );
  }
}
