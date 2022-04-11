// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Person {
  Person(
      {required this.name,
      required this.description,
      required this.hobby,
      required this.logo,
      required this.backdropPhoto,
      required this.about,
      required this.projects});

  final String name;
  final String about;
  final String hobby;
  final String backdropPhoto;
  final String description;
  final String logo;
  final List<Project> projects;
}

class Project {
  Project({@required this.title, @required this.thumbnail, @required this.url});

  final thumbnail;
  final title;
  final url;
}
