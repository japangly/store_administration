import 'package:flutter/material.dart';

class EditServiceScreen extends StatefulWidget {
  @override
  _EditServiceScreenState createState() => _EditServiceScreenState();
}

class _EditServiceScreenState extends State<EditServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Edit Service',
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
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Service Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Estimated Time',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Point',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              TextFormField(
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Bonus',
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
                        ('Done'),
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
