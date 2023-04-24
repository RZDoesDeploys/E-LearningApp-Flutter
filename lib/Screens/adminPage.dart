import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';

import 'landingPage.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Admin Panel"),
        backgroundColor: Colors.blueGrey.shade900,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.travel_explore),
            tooltip: 'Find Courses',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const LandingPage(),
                      type: PageTransitionType.fade));
            },
          )
        ],
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '+ Add new courses',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            
          ),
        ])
      );
}
