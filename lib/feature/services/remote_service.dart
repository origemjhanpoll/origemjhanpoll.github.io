import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:origemjhanpoll_github_io/feature/models/response.dart';

class RemoteService {
  final http.Client client;
  RemoteService(this.client);

  Future<Response> fetchPortifolio() async {
    final response = await client.get(Uri.parse(
        'https://raw.githubusercontent.com/origemjhanpoll/origemjhanpoll.github.io/refs/heads/main/assets/json/pt_br/data.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Response.fromJson(data);
    } else {
      throw Exception('Erro ao carregar response');
    }
  }
}
