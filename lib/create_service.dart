import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recase/recase.dart';
import 'package:store_administration/Functions/firestore.dart';
import 'package:store_administration/dialogs/error_dialog.dart';

class CreateServiceScreen extends StatefulWidget {
  @override
  _CreateServiceScreenState createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _serviceName = TextEditingController(),
      _price = TextEditingController(),
      _estimatedTime = TextEditingController(),
      _point = TextEditingController(),
      _bonus = TextEditingController(),
      _description = TextEditingController();
  bool _isLoadingState = false;
  final List<String> _listOfCategories = [
    'Make up',
    'Hair',
  ];
  String _selectedRole = "Select Category";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Create New Service',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: ModalProgressHUD(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                    controller: _serviceName,
                    validator: (value) {
                      if (value.isEmpty) {
                        return ReCase(
                          'please enter Service name',
                        ).sentenceCase;
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _price,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ReCase(
                            'please enter price',
                          ).sentenceCase;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 16.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      hint: Text(_selectedRole),
                      items: _listOfCategories.map(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: AutoSizeText(
                              value,
                              minFontSize: 12.0,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (selected) {
                        setState(() {
                          _selectedRole = selected;
                        });
                      },
                      validator: (String value) {
                        if (value?.isEmpty ?? true) {
                          return ReCase(
                            'please select a category',
                          ).sentenceCase;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                    child: TextFormField(
                      maxLength: 150,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _description,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ReCase(
                            'please enter Description',
                          ).sentenceCase;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 16.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Estimated Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _estimatedTime,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ReCase(
                            'please enter Estimated time',
                          ).sentenceCase;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                    child: TextFormField(
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Point',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _point,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ReCase(
                            'please enter point',
                          ).sentenceCase;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                    child: TextFormField(
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Bonus',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _bonus,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ReCase(
                            'please enter Bonus',
                          ).sentenceCase;
                        }
                        return null;
                      },
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
                            ('Create'),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              createService();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        inAsyncCall: _isLoadingState,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }

  void createService() async {
    setState(() {
      _isLoadingState = true;
    });
    await DatabaseFirestore().createCollection(
      collection: 'services',
      data: {
        'name': _serviceName.text.toLowerCase().trim(),
        'price': int.parse(_price.text),
        'estimated_time': int.parse(_estimatedTime.text),
        'point': int.parse(_point.text),
        'bonus': int.parse(_bonus.text),
        'category': _selectedRole.toLowerCase().trim(),
        'description': _description.text.toLowerCase().trim(),
        'created_at': Timestamp.now(),
      },
    ).whenComplete(() {
      setState(() {
        _isLoadingState = false;
      });
    }).whenComplete(() {
      Navigator.pop(context);
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (_) {
            return ErrorDialog();
          });
    });
  }
}
