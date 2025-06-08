import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteService {
  final http.Client client;
  RemoteService(this.client);
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<Map<String, dynamic>> getPortfolio() async {
    final response = await client.get(Uri.parse('$_baseUrl/posts'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
