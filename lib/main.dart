import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-vector/cute-boy-playing-game-sofa-with-headphone-cartoon-vector-icon-illustration-people-technology_138676-5483.jpg?w=1380&t=st=1709988764~exp=1709989364~hmac=e99b646d7e273696c3b9e4e0b52947922321eb099fa0b2a568d31c8afba2fc16'),
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
