import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkLayer {
  final String url;

  NetworkLayer(this.url);

  Future<dynamic> getData() async {
    debugPrint('URL: $url');
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      debugPrint('Error: ${response.statusCode}');
      return response.statusCode;
    }
  }
}
