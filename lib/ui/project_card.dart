// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters, await_only_futures, empty_statements, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:personal_profile/model/person.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard(this.project);
  final Project project;

  BoxDecoration _createShadowRoundCorners() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0),
        ]);
  }

  Widget _createThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: <Widget>[
          Image.asset(project.thumbnail),
          Positioned(bottom: 0.0, right: 0.0, child: _createLinkButton())
        ],
      ),
    );
  }

  Widget _createLinkButton() {
    return Material(
      color: Colors.white24,
      type: MaterialType.circle,
      child: IconButton(
          icon: Icon(Icons.link),
          onPressed: () async {
            if (await canLaunch(project.url)) {
              await launch(project.url);
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _createShadowRoundCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 3, child: _createThumbnail()),
          Flexible(
            flex: 2,
            child: _createCounterInfo(),
          )
        ],
      ),
    );
  }

  Widget _createCounterInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left: 4.0, right: 4.0),
      child: Text(
        project.title,
        style: TextStyle(color: Colors.white.withOpacity(0.85)),
      ),
    );
  }
}
