import 'dart:convert';

import 'package:http/http.dart' as http;

class Currency {
  final String title;
  final double amount;

  Currency({required this.title, required this.amount});

  Currency.from({required Map<String, dynamic> json})
      : title = json['title'],
        amount = json['amount'];
}

class CurrencyService {
  final String scheme = 'https';
  final String host = 'money.gtopcu.de';
  final String path = "conversion/";
  final String apiUrl = "https://money.gtopcu.de/conversion/";

  Future<List<Currency>?>? fetchCurrenciesByCurrency(String currency) async {
    var result = (await http.get(Uri(scheme: scheme, host: host, path: path + currency)));
    if (result.statusCode == 200) {
      final jsonBody = json.decode(result.body)['currencies'] as List;
      return jsonBody.map((data) => Currency.from(json: data)).toList();

    }
    return null;
  }
}
