// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class PersonDetailsIntroAnimation {
  PersonDetailsIntroAnimation(
    this.controller,
  )   : bgdropOpacity = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.001, 0.500, curve: Curves.bounceIn))),
        bgdropBlur = Tween(begin: 0.0001, end: 5.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.001, 0.800, curve: Curves.ease))),
        avatarSize = Tween(begin: 0.001, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.100, 0.400, curve: Curves.elasticInOut))),
        nameOpacity = Tween(begin: 0.001, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.350, 0.450, curve: Curves.easeIn))),
        descriptionOpacity = Tween(begin: 0.001, end: 0.600).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.500, 0.600, curve: Curves.easeIn))),
        dividerWidth = Tween(begin: 0.001, end: 225.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.650, 0.750, curve: Curves.elasticInOut))),
        aboutOpacity = Tween(begin: 0.001, end: 0.850).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.750, 0.900, curve: Curves.easeIn))),
        projectScrollerXTranslation = Tween(begin: 60.0, end: 0.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.30, 1.000, curve: Curves.ease))),
        projectScrollerOpacity = Tween(begin: 0.001, end: 1.0).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.830, 1.000, curve: Curves.fastOutSlowIn)));

  final AnimationController controller;
  final Animation<double> bgdropOpacity;
  final Animation<double> bgdropBlur;
  final Animation<double> avatarSize;
  final Animation<double> nameOpacity;
  final Animation<double> descriptionOpacity;
  final Animation<double> dividerWidth;
  final Animation<double> aboutOpacity;
  final Animation<double> projectScrollerXTranslation;
  final Animation<double> projectScrollerOpacity;
}
