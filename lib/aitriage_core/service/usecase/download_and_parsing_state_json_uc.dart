import 'dart:convert';
import 'package:flutter_aitriage/aitriage_core/service/entity/city.dart';
import 'package:flutter_aitriage/aitriage_core/service/entity/state.dart';
import 'package:http/http.dart' as http;

class DownloadAndParsingStateJsonUseCase {
  final _client = http.Client();

  Future<List<State>> execute(String url) async {
    final resp = await _client.get(Uri.parse(url));
    final parsed = jsonDecode(resp.body) as Map<String, dynamic>;
    final result = (parsed?['RECORDS'] as List).map((e) => State.fromJson(e)).toList();

    return result;
  }
}