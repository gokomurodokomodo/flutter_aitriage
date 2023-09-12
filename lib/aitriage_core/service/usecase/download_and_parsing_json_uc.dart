import 'dart:convert';
import 'package:http/http.dart' as http;

class DownloadAndParsingJsonUseCase {
  final _client = http.Client();

  Future<List<T>> execute<T>(String url, T Function(dynamic) parser) async {
    final resp = await _client.get(Uri.parse(url));
    final parsed = jsonDecode(resp.body) as Map<String, dynamic>;
    final result = (parsed['RECORDS'] as List).map((e) => parser.call(e)).toList();

    return result;
  }
}