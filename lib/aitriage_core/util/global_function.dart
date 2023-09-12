import 'package:flutter/material.dart';
import '../entity/param_type.dart';
// CachedImage for intro and get_startedScreen
// Use imageCache.clear() to clear all
final cachedImage = <Image>[];
// Save the country for later use to optimize api calling
// getCountry api in ApiService
final paramTypes = <ParamType>[];
