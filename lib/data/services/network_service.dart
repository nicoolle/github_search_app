import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ledsdoit/constants/messages.dart';

class NetworkService {
  final String baseURL;

  NetworkService({required this.baseURL});

  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseURL$endpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      switch (response.statusCode) {
        case 500:
          throw Exception(ErrorMessages.invalidResponse);
        default:
          throw Exception(ErrorMessages.networkError);
      }
    }
  }
}
