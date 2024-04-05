import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? timezone;
  String? time;

  WorldTime({this.time, this.timezone});

  static Future<WorldTime?> getCurrentTimeBasedOnLocation(String location) async {
    var url = Uri.http('worldtimeapi.org', 'api/timezone/$location');
    Response response = await get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return formatWorldTime(data);
    } else {
      debugPrint('request failed with status: ${response.statusCode}');
      return null;
    }
  }

  static Future<WorldTime?> getCurrentTimeBasedOnIP() async {
    var url = Uri.http('worldtimeapi.org', '/api/ip');
    Response response = await get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return formatWorldTime(data);
    } else {
      debugPrint('request failed with status: ${response.statusCode}');
      return null;
    }
  }

  static WorldTime? formatWorldTime(Map<String, dynamic> data) {
    String datetime = data['datetime'];
    String offset = (data['utc_offset'] as String).substring(1, 3);

    DateTime currentTime = DateTime.parse(datetime);
    currentTime = currentTime.add(Duration(hours: int.parse(offset)));
    String time = DateFormat.jm().format(currentTime);

    return WorldTime(
      time: time,
      timezone: data['timezone'].split('/')[1],
    );
  }

  @override
  String toString() {
    return 'timezone = $timezone, time = $time';
  }
}
