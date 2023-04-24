import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../landingPage.dart';

class CppCourse extends StatefulWidget {
  const CppCourse({super.key});

  @override
  State<CppCourse> createState() => _CppCourseState();
}

class _CppCourseState extends State<CppCourse> {
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
          title: const Text("Learn C++ Language"),
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
                    'C++',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                      'C++ is a high-level programming language developed in the 1980s by Bjarne Stroustrup at Bell Labs.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'C++ is an extension of the C language, with added features such as object-oriented programming (OOP) and templates.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'C++ is a compiled language, which means that it needs to be translated into machine code before it can be executed.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'C++ is a versatile language that can be used for system programming, embedded systems, and applications development.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'C++ supports OOP concepts such as classes, objects, encapsulation, inheritance, and polymorphism.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'C++ supports generic programming using templates, which allow functions and classes to operate with generic types.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'C++ supports operator overloading, which allows operators such as + and - to be redefined for user-defined types.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'C++ supports exception handling, which allows errors to be detected and handled in a structured manner.',
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
                  "pdf/cpp.pdf",
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
