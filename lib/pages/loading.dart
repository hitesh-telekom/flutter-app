import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/pages/home.dart';
import 'package:test_app/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loading';
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  getLocations() async {
    WorldTime? currentTime = await WorldTime.getCurrentTimeBasedOnIP();
    debugPrint('currentTime = $currentTime');
    Navigator.pushReplacementNamed(
      context,
      HomeScreen.routeName,
      arguments: currentTime
    );
  }

  @override
  void initState() {
    super.initState();
    getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitCircle(
        color: Colors.green,
        size: 50.0,
      ),
    );
  }
}
