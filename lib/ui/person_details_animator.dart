// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:personal_profile/Repo/repo.dart';
import 'package:personal_profile/ui/person_details_page.dart';

class PersonDetailsAnimator extends StatefulWidget {
  @override
  _PersonDetailsAnimatorState createState() => _PersonDetailsAnimatorState();
}

class _PersonDetailsAnimatorState extends State<PersonDetailsAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(microseconds: 1780),
      vsync: this,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersonDetailsPage(
      person: RepoData.bawp,
      controller: _controller,
    );
  }
}
