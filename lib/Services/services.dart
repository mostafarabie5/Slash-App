import 'dart:convert';
import 'package:flutter/services.dart';

class Services {
  static Future<Map<String, dynamic>> jsonLoadFromAssets(
      String filePath) async {
    String json = await rootBundle.loadString(filePath);
    return jsonDecode(json);
  }
}
