import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:recase/recase.dart';

import 'Functions/authentication.dart';
import 'Functions/firestore.dart';
import 'Functions/storage.dart';
import 'dialogs/duplicate_dialog.dart';
import 'dialogs/fail_dialog.dart';
import 'env.dart';

class CreateStaffScreen extends StatefulWidget {
  const CreateStaffScreen({Key key, @required this.imageFile})
      : super(key: key);

  final File imageFile;

  @override
  _CreateStaffScreenState createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  final dateFormat = DateFormat("yyyy-MM-dd");
  final FocusNode focus = FocusNode();

  TextEditingController _firstName = TextEditingController(),
      _lastName = TextEditingController(),
      _nickName = TextEditingController(),
      _pob = TextEditingController(),
      _address = TextEditingController(),
      _phoneNumber = TextEditingController(),
      _email = TextEditingController(),
      _dob = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoadingState = false;
  final List<String> _listOfRole = [
    'HR',
    'sale',
    'admin',
    'servicer',
    'stock manager'
  ];

  DateTime _dateOfBirth, _selectdate;
  String _selectedRole = "Select Role";

  Future<bool> isDuplicationExists() async {
    DocumentSnapshot email;
    setState(() {
      _isLoadingState = true;
    });
    email = await DatabaseFirestore()
        .getCollectionByField(
            collection: 'employees',
            field: 'email',
            value: _email.text.toLowerCase().trim())
        .whenComplete(() {
      setState(() {
        _isLoadingState = false;
      });
    });
    return email != null;
  }

  void createEmployee() async {
    setState(() {
      _isLoadingState = true;
    });
    String userId = await Authentication().createUserWithEmailAndPassword(
        email: _email.text.toLowerCase().trim(), password: '123456');
    if (userId != null) {
      await DatabaseFirestore().createCollection(
        collection: 'employees',
        data: {
          'address': _address.text.toLowerCase().trim(),
          'created_at': Timestamp.now(),
          'last_name': _lastName.text,
          'first_name': _firstName.text,
          'email': _email.text.toLowerCase().trim(),
          'date_of_birth': Timestamp.fromDate(_selectdate),
          'place_of_birth': _pob.text.toLowerCase().trim(),
          'phone_number': _phoneNumber.text,
          'image': await Storage().uploadFile(
            collection: 'products',
            fileName: Timestamp.now().millisecondsSinceEpoch.toString(),
            file: widget.imageFile,
          ),
          'role': _selectedRole.toLowerCase().trim(),
          'salary_per_hour': 5,
          'uid': userId,
        },
      ).whenComplete(() {
        setState(() {
          _isLoadingState = false;
        });
      }).whenComplete(() {
        Navigator.pop(context);
      });
    } else {
      setState(() {
        _isLoadingState = false;
      });
      showDialog(
          context: context,
          builder: (_) {
            return FailDialog();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Create New Staff',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: ModalProgressHUD(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                  child: CircleAvatar(
                    radius: Environment().getHeight(height: 3),
                    backgroundImage: FileImage(widget.imageFile),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          controller: _firstName,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please input First Name',
                              ).sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          controller: _lastName,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please input Last Name',
                              ).sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Nick Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          controller: _nickName,
                          validator: (nickname) {
                            if (nickname.isEmpty) {
                              return ReCase('please input nickname')
                                  .sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 50,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          controller: _email,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please input Email',
                              ).sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                controller: _dob,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: 'Date of Birth',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return ReCase(
                                            'please enter the date of birth')
                                        .sentenceCase;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(
                                    SimpleLineIcons.getIconData('calendar')),
                                onPressed: () {
                                  DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: DateTime(1900, 1, 1),
                                    onConfirm: (date) {
                                      setState(() {
                                        _selectdate = DateTime.utc(
                                          date.year,
                                          date.month,
                                          date.day,
                                        );
                                        this._dob.text =
                                            '${DateFormat("dd/MM/y").format(_selectdate)}';
                                      });
                                    },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 50,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          controller: _phoneNumber,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please input Phone Number',
                              ).sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Place of Birth',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          controller: _pob,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ReCase(
                                'please input Place of Birth',
                              ).sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          controller: _address,
                          validator: (address) {
                            if (address.isEmpty) {
                              return ReCase('please input Address')
                                  .sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          hint: Text(_selectedRole),
                          items: _listOfRole.map(
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
                                'please select a role',
                              ).sentenceCase;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
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
                                padding: const EdgeInsets.all(16.0),
                                child: new Text(
                                  ('Create'),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    if (await isDuplicationExists()) {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return DuplicateDialog();
                                          });
                                    } else {
                                      createEmployee();
                                    }
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
              ],
            ),
          ),
        ),
        inAsyncCall: _isLoadingState,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }
}
