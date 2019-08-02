import 'package:flutter/material.dart';
import 'package:store_administration/change_password.dart';
import 'package:store_administration/dashboard.dart';
import 'package:store_administration/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'store_administration',
      home: DashboardScreen(),
    ),
  );
}
