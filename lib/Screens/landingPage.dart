
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';

import 'adminPage.dart';
import 'courseScreens/cCourse.dart';
import 'courseScreens/cppCourse.dart';
import 'courseScreens/cssCourse.dart';
import 'courseScreens/htmlCourse.dart';
import 'courseScreens/javaCourse.dart';
import 'courseScreens/jsCourse.dart';
import 'courseScreens/pythonCourse.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.blueGrey.shade900,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.book),
              tooltip: 'Saved Courses',
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const CollectionPage(),
                        type: PageTransitionType.fade));
              },
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildRoundedCardHeading1(),
            buildImageInteractionCardC(),
            buildImageInteractionCardCplusplus(),
            buildImageInteractionCardJava(),
            buildImageInteractionCardPython(),
            buildRoundedCardHeading2(),
            buildImageInteractionCardHTML(),
            buildImageInteractionCardCSS(),
            buildImageInteractionCardJavascript(),
          ],
        ),
      );

  Widget buildRoundedCardHeading1() => Card(
        color: Colors.grey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Software Engineering',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildImageInteractionCardC() => Card(
        color: Colors.grey.shade900,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset("images/img1.jpg"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'Learn C Language',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Get Course >'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const CCourse(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionCardCplusplus() => Card(
        color: Colors.grey.shade900,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset("images/img2.png"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'Learn C++ Language',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Get Course >'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const CppCourse(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionCardJava() => Card(
        color: Colors.grey.shade900,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset("images/img4.png"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'Learn Java Programming',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Get Course >'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const JavaCourse(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionCardPython() => Card(
        color: Colors.grey.shade900,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset("images/img3.jpg"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'Learn Python Programming',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Get Course >'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const PythonCourse(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )
          ],
        ),
      );

  Widget buildRoundedCardHeading2() => Card(
        color: Colors.grey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Web Technology',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildImageInteractionCardHTML() => Card(
        color: Colors.grey.shade900,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset("images/img5.jpg"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'Learn HTML',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Get Course >'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const HTMLCourse(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionCardCSS() => Card(
        color: Colors.grey.shade900,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset("images/img6.png"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'Learn CSS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Get Course >'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const CSSCourse(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionCardJavascript() => Card(
        color: Colors.grey.shade900,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset("images/img7.jpg"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: const Text(
                'Learn Javascript',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('Get Course >'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const JSCourse(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                )
              ],
            )
          ],
        ),
      );
}
