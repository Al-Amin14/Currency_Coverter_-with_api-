// To parse this JSON data, do
//
//     final latestConvert = latestConvertFromJson(jsonString);

import 'dart:convert';

LatestConvert latestConvertFromJson(String str) => LatestConvert.fromJson(json.decode(str));

String latestConvertToJson(LatestConvert data) => json.encode(data.toJson());

class LatestConvert {
    String disclaimer;
    String license;
    int timestamp;
    String base;
    Map<String, double> rates;

    LatestConvert({
        required this.disclaimer,
        required this.license,
        required this.timestamp,
        required this.base,
        required this.rates,
    });

    factory LatestConvert.fromJson(Map<String, dynamic> json) => LatestConvert(
        disclaimer: json["disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
