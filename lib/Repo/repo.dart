import 'package:personal_profile/model/person.dart';

class RepoData {
  static final Person bawp = Person(
      name: "Hello. My Name is Myles",
      description: "I am a Software Developer",
      hobby: "I love Developing apps",
      logo: "assets/Me.jpeg",
      backdropPhoto: "assets/Me.jpeg",
      about:
          " I have experience in a UI Prototyping Front and Back_end development",
      projects: <Project>[
        Project(
            thumbnail: 'assets/Adobe_XD2.png',
            title: 'Interactive Prototype',
            url: 'www.google.com'),
        Project(
            thumbnail: 'assets/angular.jpeg',
            title: 'Back-end Development in Node js',
            url: 'www.google.com'),
        Project(
            thumbnail: 'assets/reactjs.jpeg',
            title: 'Web Development',
            url: 'www.google.com'),
        Project(
            thumbnail: 'assets/Flutter-logo.png',
            title: 'Safety App ',
            url: 'www.google.com'),
      ]);
}
