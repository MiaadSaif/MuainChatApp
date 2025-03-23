import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://your-api.com"; // Replace with your API URL

  Future<List<Map<String, dynamic>>> fetchMessages() async {
    final response = await http.get(Uri.parse('$baseUrl/messages'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception("Failed to load messages");
    }
  }

  Future<void> sendMessage(String message) async {
    await http.post(
      Uri.parse('$baseUrl/messages'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"text": message}),
    );
  }
}
