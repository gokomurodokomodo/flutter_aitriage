import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_system_param/system_param.dart';
import '../entity/country.dart';
import '../entity/param_type.dart';
// CachedImage for intro and get_startedScreen
// Use imageCache.clear() to clear all
final cachedImage = <Image>[];
// Save the country for later use to optimize api calling
// getCountry api in ApiService
final countryList = <Country>[];
var systemParam = SystemParam.fromJson(null);
final paramTypes = <ParamType>[];
