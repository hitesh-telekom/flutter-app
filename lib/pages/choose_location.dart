import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app/services/time_zones.dart';
import 'package:test_app/services/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  static const routeName = '/choose_location';
  final String title;

  const ChooseLocationScreen({super.key, required this.title});

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  bool isLoading = false;
  List<String> locations = [];

  getLocations() async {
    try {
      List<String> locationsResponse = await TimeZone.getTimeZones();
      setState(() {
        locations = locationsResponse;
        isLoading = false;
      });
    } catch (error) {
      if (!context.mounted) return;

      debugPrint('Reached here');
      setState(() {
        locations = [];
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Something went wrong'),
          action: SnackBarAction(
            label: 'Go Back',
            onPressed: () {
              debugPrint('Going back');
            },
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading
          ? const SpinKitCircle(
              color: Colors.green,
              size: 50.0,
            )
          : LocationList(locations: locations),
    );
  }
}

class LocationList extends StatelessWidget {
  const LocationList({
    super.key,
    required this.locations,
  });

  final List<String> locations;

  getLocationTime(BuildContext context, String location) async {
    WorldTime? currentTime =
        await WorldTime.getCurrentTimeBasedOnLocation(location);
    debugPrint('currentTime = $currentTime');

    Navigator.pop(context, currentTime);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              onTap: () {
                getLocationTime(context, locations[index]);
              },
              title: Text(
                locations[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
