import 'package:currency_convert_api/models/fetching_chracters.dart';
import 'package:currency_convert_api/models/fetching_currencys.dart';
import 'package:http/http.dart' as http;

Future<LatestConvert> fetchlatest() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?app_id=d38be9fcf65540699af40d1d76ef6598&base=USD&symbols=%22&prettyprint=false&show_alternative=false'));
  final result = latestConvertFromJson(response.body);
  return result;
}

Future<Map> fetchcurrencies() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/currencies.json?prettyprint=false&show_alternative=false&show_inactive=false&app_id=d38be9fcf65540699af40d1d76ef6598'));
  final allcurrencies = fetcingCurrenciesFromJson(response.body);
  return allcurrencies;
}

String ConverterUsd(Map exchangeRates, String usd, String currency) {
  String output =
      ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2))
          .toString();
  return output;
}

converter_any_to_any(
    Map exhageRates, String usd, String currency1, String currency2) {
  String output = ((double.parse(usd)/exhageRates[currency1]*exhageRates[currency2]).toStringAsFixed(2)).toString();
  return output;
}
