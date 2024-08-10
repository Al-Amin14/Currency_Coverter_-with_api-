// To parse this JSON data, do
//
//     final fetcingCurrencies = fetcingCurrenciesFromJson(jsonString);

import 'dart:convert';

Map<String, String> fetcingCurrenciesFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String fetcingCurrenciesToJson(Map<String, String> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
