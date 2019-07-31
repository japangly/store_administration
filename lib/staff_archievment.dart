import 'package:flutter/material.dart';

class StaffAchievement extends StatefulWidget {
  @override
  _StaffAchievementState createState() => _StaffAchievementState();
}

class _StaffAchievementState extends State<StaffAchievement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Staff Achievement'),
      ),
    );
  }
}
