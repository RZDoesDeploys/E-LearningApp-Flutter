import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../landingPage.dart';

class JSCourse extends StatefulWidget {
  const JSCourse({super.key});

  @override
  State<JSCourse> createState() => _JSCourseState();
}

class _JSCourseState extends State<JSCourse> {
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
          title: const Text("Learn Javascript"),
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
                    'JavaScript',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),                  
                    Text(
                      'JavaScript is a popular programming language that is used primarily to create interactive web applications.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'JavaScript was created in 1995 by Brendan Eich while he was working at Netscape Communications Corporation.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'JavaScript is an object-oriented language that uses a prototype-based model instead of the class-based model used by many other programming languages.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'JavaScript is used for a wide variety of applications, including web development, server-side development, and desktop application development.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'JavaScript is often used in conjunction with other web technologies like HTML and CSS to create interactive and dynamic web pages.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'JavaScript is an interpreted language, which means that it is executed directly by the browser or runtime environment without the need for compilation.',
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
                  "pdf/js.pdf",
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