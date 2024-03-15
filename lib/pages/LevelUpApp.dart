import 'package:flutter/material.dart';

class LevelUpApp extends StatefulWidget {
  const LevelUpApp({super.key});

  @override
  State<LevelUpApp> createState() => _LevelUpAppState();
}

class _LevelUpAppState extends State<LevelUpApp> {
  int level = 0;
  final double verticalPadding = 3;
  final double horizontalPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appbar Demo",
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan[400],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Container(
        color: Colors.cyan[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.avif'),
                  radius: 50,
                ),
              ),
            ),
            const Divider(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blueGrey[400],
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Text(
                'Hitesh Garg',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green[400],
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Text(
                'Current Level',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blueGrey[400],
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Text(
                "$level",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green[400],
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[300],
        onPressed: () {
          setState(() {
            level++;
          });
          print("floating button pressed");
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
