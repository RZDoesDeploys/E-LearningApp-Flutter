import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../landingPage.dart';

class CCourse extends StatefulWidget {
  const CCourse({super.key});

  @override
  State<CCourse> createState() => _CCourseState();
}

class _CCourseState extends State<CCourse> {
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
        title: const Text("Learn C Language"),
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
                    'C Language',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'C is a high-level programming language developed in the 1970s by Dennis Ritchie at Bell Labs.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C is a compiled language, which means that it needs to be translated into machine code before it can be executed.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C is a procedural language, which means that it is organized around procedures or functions that perform specific tasks.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C is a versatile language that can be used for system programming, embedded systems, and applications development.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C is a strongly-typed language, which means that variables must be declared with a specific data type before they can be used.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C supports various types of data including integers, characters, floating-point numbers, and arrays.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C has a rich set of operators including arithmetic, relational, logical, and bitwise operators.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C uses pointers, which are variables that hold the memory addresses of other variables, to provide direct access to memory.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'C supports control structures such as if-else statements, loops, and switch statements to control the flow of program execution.',
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
                  "pdf/c_lang.pdf",
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
