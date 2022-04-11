// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

import 'ui/person_details_animator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myles Flutter Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new PersonDetailsAnimator(),
    );
  }
}
