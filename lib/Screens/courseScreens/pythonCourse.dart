import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../landingPage.dart';

class PythonCourse extends StatefulWidget {
  const PythonCourse({super.key});

  @override
  State<PythonCourse> createState() => _PythonCourseState();
}

class _PythonCourseState extends State<PythonCourse> {
  // 3 options
  var index = 0;
  final PageController pageController = PageController();
  final Curve _curve = Curves.ease;
  final Duration _duration = const Duration(milliseconds: 300);

  _navigateToPage(value) {
    // When BottomNavigationBar button is clicked, navigate to assigned page
    switch (value) {
      case 0:
        value = 0;
        break;
      case 1:
        value = 1;
        break;
      case 2:
        value = 2;
        break;
    }
    pageController.animateToPage(value, duration: _duration, curve: _curve);
    setState(() {
      index = value;
    });
  }

  // Set BottomNavigationBar indicator only on pages allowed
  _getNavBarIndex(index) {
    if (index == 0) {
      return 0;
    } else if (index == 1) {
      return 1;
    } else if (index == 2) {
      return 2;
    } else {
      return 0;
    }
  }

  // youtube video
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'U3aXWizDbQ4',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: false,
      ),
    );
  }

 @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const LandingPage(),
                      type: PageTransitionType.leftToRightWithFade));
            },
            icon: const Icon(Icons.home),
          ),
          title: const Text("Learn Python Programming"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900,
        ),
     body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            index = page;
          });
        },
        children: <Widget>[
          // Notes

          Container(
            color: Colors.black,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  Text(
                    'Python Programming',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                 Text(
                      'Python is a popular programming language that is used for a wide variety of applications, including web development, data analysis, artificial intelligence, and scientific computing.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Python was created in the late 1980s by Guido van Rossum while he was working at the National Research Institute for Mathematics and Computer Science in the Netherlands.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Python is an interpreted language, which means that it is executed directly by the Python interpreter without the need for compilation.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Python is known for its readability and ease of use, making it a popular choice for both novice and experienced programmers.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Python has a large standard library that provides a wide range of functionality, making it a versatile language for many different applications.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Python is often used in conjunction with other programming languages and technologies like JavaScript, HTML, and CSS to create complex applications and websites.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Python is open-source and has a large and active community of developers, which has led to the creation of many libraries and frameworks that extend the language and provide additional functionality.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Python is constantly evolving, with new features and capabilities being added to the language on a regular basis.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),

          // YT Video
          Container(
            color: Colors.black,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                    playedColor: Colors.amber, handleColor: Colors.amberAccent),
              ),
              builder: (context, player) {
                return Scaffold(
                  body: player,
                );
              },
            ),
          ),

          // PDF

          Container(
            color: Colors.black,
            child: Container(
                padding: const EdgeInsets.all(16),
                child: SfPdfViewer.asset(
                  "pdf/python.pdf",
                )),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey.shade900,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => _navigateToPage(value),
        currentIndex: _getNavBarIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notes), label: 'Notes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library), label: 'Videos'),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf), label: 'PDF`s')
        ],
      ));
}