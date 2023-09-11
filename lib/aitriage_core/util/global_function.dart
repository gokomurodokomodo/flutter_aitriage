import 'package:flutter/material.dart';
import '../service/entity/country.dart';
import '../service/entity/param_type.dart';
import '../service/entity/system_param.dart';
// CachedImage for intro and get_startedScreen
// Use imageCache.clear() to clear all
final cachedImage = <Image>[];
// Save the country for later use to optimize api calling
// getCountry api in ApiService
final countryList = <Country>[];
var systemParam = SystemParam.fromJson(null);
final paramTypes = <ParamType>[];
