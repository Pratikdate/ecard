import 'package:flutter/material.dart';



class UserInfoLayout extends StatefulWidget {
  const UserInfoLayout({super.key});

  @override
  State<UserInfoLayout> createState() => _UserInfoLayoutState();
}

class _UserInfoLayoutState extends State<UserInfoLayout> {
  final controller1=TextEditingController();
  final controller2=TextEditingController();
  final controller3=TextEditingController();
  final controller4=TextEditingController();
  final controller5=TextEditingController();
  final controller6=TextEditingController();

  String title="John Grandson";
  String subtitle="Real Estate Broker";
  String about="This package is also a submission to Flutter Create contest. The basic rule of this contest is to measure the total Dart file size less or equal 5KB.After unzipping the compressed file, run following command to update dependencies";
  String twitter='';
  String linkedin='';
  String website='';
  String Userimg="https://cdn.vectorstock.com/i/1000x1000/13/68/person-gray-photo-placeholder-man-vector-23511368.webp";
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
