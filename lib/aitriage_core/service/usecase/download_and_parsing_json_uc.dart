import 'dart:convert';
import 'package:http/http.dart' as http;

class DownloadAndParsingJsonUseCase {
  Future<List<T>> execute<T>(String url, T Function(dynamic) parser) async {
    // need to init new client for each execute call
    // if callback use the same instance of client will emit connection auto close error
    final client = http.Client();
    final resp = await client.get(Uri.parse(url));
    final parsed = jsonDecode(resp.body) as List;
    final result = parsed.map((e) => parser.call(e)).toList();

    return result;
  }
}