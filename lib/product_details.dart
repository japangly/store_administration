import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/octicons.dart';
import 'env.dart';
import 'themes/helpers/fonts.dart';
import 'themes/helpers/theme_colors.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'https://cdn.shopify.com/s/files/1/0838/7991/products/Shampoo_copy_e614e1d7-ab42-4426-bad8-f1782df3f4fa.jpg?v=1559147001',
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
                        'name',
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
                        'category',
                        style: font15Grey,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
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
                          'In Stock: ',
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
                          'In Use: ',
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
                child: Text('description'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Created at: ',
                          style: TextStyle(color: Colors.blue[500]),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Updated at: ',
                          style: TextStyle(color: Colors.green[500]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('By: '),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
