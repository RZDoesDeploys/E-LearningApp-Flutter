import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../landingPage.dart';

class JavaCourse extends StatefulWidget {
  const JavaCourse({super.key});

  @override
  State<JavaCourse> createState() => _JavaCourseState();
}

class _JavaCourseState extends State<JavaCourse> {
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
          title: const Text("Learn Java Programming"),
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
                    'Java Programming',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                    Text(
                      'Java is a general-purpose programming language that is designed to be platform-independent and secure.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Java was created in the mid-1990s by James Gosling at Sun Microsystems, and has since become one of the most popular programming languages in use today.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Java is an object-oriented language, which means that it is based on the concept of classes and objects.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Java is used for a wide variety of applications, from desktop and mobile applications to web applications and enterprise systems.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Java code is compiled into bytecode, which can run on any platform that has a Java Virtual Machine (JVM) installed.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Java provides a vast array of libraries and APIs, making it easy to build complex applications quickly and efficiently.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Java is a popular language for enterprise systems, with many large organizations using Java to power their core business applications.',
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
                  "pdf/java.pdf",
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