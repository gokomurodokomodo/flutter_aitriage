import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_system_param/system_param.dart';

import '../service/api_service/get_country/country.dart';

// CachedImage for intro and get_startedScreen
// Use imageCache.clear() to clear all
final cachedImage = <Image>[];
// Save the country for later use to optimize api calling
// getCountry api in ApiService
final countryList = <Country>[];
var systemParam = SystemParam.fromJson(null);

///[isConnectedToInternet] check if device is connected to internet or not.
Future<bool> isConnectedToInternet() async{
  final connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult != ConnectivityResult.none;
}