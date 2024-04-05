import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TimeZone {
  static Future<List<String>> getTimeZones() async {
    var url = Uri.http('worldtimeapi.org', '/api/timezone');
    Response response = await get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      List<String> locations = jsonResponse.map((e) => (e as String)).toList();
      return locations;
    } else {
      debugPrint('request failed with status: ${response.statusCode}');
      return <String>[];
    }
  }
}
