import 'package:flutter/material.dart';
import 'package:test_app/services/world_time.dart';

import 'choose_location.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  static const routeName = '/';

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WorldTime? currentTime;

  getUpdatedTime() async {
    WorldTime? updatedTime = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const ChooseLocationScreen(title: 'Choose Location Screen'),
      ),
    );

    debugPrint('updatedTime = $updatedTime');
    if (!context.mounted) return;

    setState(() {
      currentTime = updatedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentTime =
        currentTime ?? ModalRoute.of(context)!.settings.arguments as WorldTime?;
    debugPrint('currentTime = $currentTime');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: getUpdatedTime,
              icon: const Icon(Icons.edit_location),
              label: const Text('Edit Location'),
            ),
            Text(
              '${currentTime?.timezone}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '${currentTime?.time}',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
