import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'landingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: const LandingPage(),
                type: PageTransitionType.rightToLeftWithFade)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300.0,
              child: Image.asset("images/logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MaterialButton(
              onPressed: () {},
              child: const Text("Made by Rikin Zala, IU2041230201",
                  style: TextStyle(color: Colors.white, fontSize: 15.0)),
            ),
          ])),
    );
  }
}
