import 'dart:convert';
import 'package:flutter_aitriage/aitriage_core/service/entity/country.dart';
import 'package:http/http.dart' as http;

class DownloadAndParsingCountryJson {
  final _client = http.Client();

  Future<List<Country>> execute(String url) async {
    final resp = await _client.get(Uri.parse(url));
    final parsed = jsonDecode(resp.body) as Map<String, dynamic>;
    final result = (parsed?['RECORDS'] as List).map((e) => Country.fromJson(e)).toList();

    return result;
  }
}