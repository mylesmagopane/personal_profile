// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, unused_import, unnecessary_new

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:personal_profile/ui/person_details_intro_animation.dart';
import 'package:personal_profile/ui/project_card.dart';
import 'dart:ui' as ui;

import '../model/person.dart';

class PersonDetailsPage extends StatelessWidget {
  PersonDetailsPage(
      {required this.person, required AnimationController controller})
      : animation = PersonDetailsIntroAnimation(controller);

  final Person person;
  final PersonDetailsIntroAnimation animation;

  Widget _createAnimation(BuildContext context, Widget? child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: animation.bgdropOpacity.value,
          child: Image.asset(
            person.backdropPhoto,
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: animation.bgdropBlur.value,
            sigmaY: animation.bgdropBlur.value,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: AnimatedBuilder(
            animation: animation.controller, builder: _createAnimation));
  }

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _createLogoAvatar(),
            _createAboutPerson(),
            _createProjectScroller()
          ]),
    );
  }

  Widget _createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 110.0,
        margin: EdgeInsets.only(top: 32.0, left: 19.0),
        padding: EdgeInsets.all(3.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(person.logo),
                      fit: BoxFit.cover,
                    ),
                    color: Color.fromARGB(255, 163, 163, 163),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                person.name,
                style: TextStyle(
                  fontSize: 19 * animation.avatarSize.value + 2.0,
                  color: Colors.white70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createAboutPerson() {
    return Padding(
      padding: EdgeInsets.only(top: 14.0, left: 14.0, right: 14.0),
      child: Column(
        children: <Widget>[
          Text(
            person.description,
            style: TextStyle(
                color: Colors.white.withOpacity(animation.nameOpacity.value),
                fontSize: 30.0 * animation.avatarSize.value + 2.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            person.hobby,
            style: TextStyle(
              color:
                  Colors.white.withOpacity(animation.descriptionOpacity.value),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.79),
            margin: EdgeInsets.symmetric(vertical: 14.0),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),
          Text(
            person.about,
            style: TextStyle(
                color: Colors.white.withOpacity(animation.aboutOpacity.value),
                height: 1.4),
          )
        ],
      ),
    );
  }

  Widget _createProjectScroller() {
    return Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Transform(
        transform: Matrix4.translationValues(
            animation.projectScrollerXTranslation.value, 0.0, 0.0),
        child: SizedBox.fromSize(
          size: Size.fromHeight(
            (250.0),
          ),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              itemCount: person.projects.length,
              itemBuilder: (BuildContextcontext, int index) {
                var project = person.projects.elementAt(index);
                return ProjectCard(project);
              }),
        ),
      ),
    );
  }
}
