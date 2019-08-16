import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

import 'Functions/firestore.dart';
import 'create_staff.dart';
import 'dialogs/camera_dialog.dart';
import 'dialogs/delete_dialog.dart';
import 'edit_staff.dart';
import 'env.dart';
import 'staff_profile_screen.dart';
import 'themes/helpers/theme_colors.dart';

class ListStaffScreen extends StatefulWidget {
  @override
  _ListStaffScreenState createState() => _ListStaffScreenState();
}

String _selectedNameStaff = 'first_name';
List<String> _listNameStaff = ['first_name', 'created_at', 'salary_per_hour'];

class _ListStaffScreenState extends State<ListStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3b3b3b),
      appBar: AppBar(
        elevation: 8.0,
        backgroundColor: Color(0xFF0c0c0c),
        title: Text('Staff List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Flexible(
                child: Container(),
              ),
              Flexible(
                child: Card(
                  color: blackColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    child: DropdownButton<String>(
                      hint: AutoSizeText(
                        _selectedNameStaff,
                        minFontSize: 12.0,
                        style: TextStyle(color: whiteColor),
                      ),
                      items: _listNameStaff.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: AutoSizeText(
                            value,
                            minFontSize: 12.0,
                          ),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          _selectedNameStaff = selected;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          new StreamListStaff(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: whiteColor,
        child: Icon(
          Icons.add,
          color: blackColor,
          size: 40.0,
        ),
        onPressed: () async {
          try {
            await ImagePicker.pickImage(source: ImageSource.camera).then(
              (imageFile) async {
                await ImageCropper.cropImage(
                  sourcePath: imageFile.path,
                  toolbarTitle: 'Edit Photo',
                  toolbarColor: Colors.blue,
                  toolbarWidgetColor: Colors.white,
                  ratioX: 1.0,
                  ratioY: 1.0,
                  maxWidth: 512,
                  maxHeight: 512,
                ).then((imageFile) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return CreateStaffScreen(
                          imageFile: imageFile,
                        );
                      },
                    ),
                  );
                });
              },
            );
          } on PlatformException catch (e) {
            if (e.code == BarcodeScanner.CameraAccessDenied) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return CameraDialog();
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (_) {
                    return CameraDialog();
                  });
            }
          } on FormatException {
            // FormatException to be handled
            showDialog(
                context: context,
                builder: (_) {
                  return CameraDialog();
                });
          } catch (e) {
            // FormatException to be handled
            showDialog(
                context: context,
                builder: (_) {
                  return CameraDialog();
                });
          }
        },
      ),
    );
  }
}

class StreamListStaff extends StatelessWidget {
  const StreamListStaff({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: DatabaseFirestore().getStreamCollection(
          collection: 'employees',
          orderBy: _selectedNameStaff.toLowerCase(),
          isDescending: false,
        ),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return snapshot.data == null
                  ? Center(
                      child: Text('No Data',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0)),
                    )
                  : ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: snapshot.data.documents.map(
                        (DocumentSnapshot document) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          StaffProfile(
                                        document: document,
                                      ),
                                    ),
                                  );
                                },
                                child: Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  child: Container(
                                    color: blackColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      document.data['image'],
                                                      height: Environment()
                                                          .getHeight(
                                                              height: 3.5),
                                                      width: Environment()
                                                          .getWidth(width: 6.0),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 32.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        AutoSizeText(
                                                          ReCase(document.data[
                                                                      'last_name'] +
                                                                  ' ' +
                                                                  document.data[
                                                                      'first_name'])
                                                              .titleCase,
                                                          style: TextStyle(
                                                            color: whiteColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          minFontSize: 20.0,
                                                          maxFontSize: 128.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: AutoSizeText(
                                                            document
                                                                .data['role'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                            minFontSize: 18.0,
                                                            maxFontSize: 128.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 8.0),
                                                          child: AutoSizeText(
                                                            document.data[
                                                                'phone_number'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                            minFontSize: 18.0,
                                                            maxFontSize: 128.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: AutoSizeText(
                                                  document
                                                      .data['salary_per_hour']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  minFontSize: 24.0,
                                                  maxFontSize: 128.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: whiteColor,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Created at: ${DateFormat("dd/MM/y").format(document.data['created_at'].toDate()).toString()}',
                                                    style: TextStyle(
                                                      color: Colors.grey,
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
                                  secondaryActions: <Widget>[
                                    IconSlideAction(
                                      caption: 'Edit',
                                      color: Colors.grey,
                                      icon: Icons.edit,
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  EditStaffScreen())),
                                    ),
                                    IconSlideAction(
                                        caption: 'Delete',
                                        color: Colors.red,
                                        icon: Icons.delete,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return DeleteDialog(
                                                  deleteCallBack: () {},
                                                );
                                              });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
          }
        });
  }
}
