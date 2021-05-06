import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_flutter_app/business_logic/models/rate.dart';

import 'web_api.dart';

// This class is the concrete implementation of [WebApi]. It contains the logic
// to get the exchange rate data from api.exchangeratesapi.io. However, no other
// class in the app knows that, so if you wanted to swap out a different web API,
// this is the only place you would need to make the change.
class WebApiImpl implements WebApi {
  final _host = 'api.exchangeratesapi.io';
  final _path = 'latest';
  final Map<String, String> _headers = {'Accept': 'application/json'};

  List<Rate> _rateCache;

  Future<List<Rate>> fetchExchangeRates() async {
    if (_rateCache == null) {
      print('getting rates from the web');
      final uri = Uri.https(_host, _path);
      final results = await http.get(uri, headers: _headers);
      final jsonObject = json.decode(results.body);
      _rateCache = _createRateListFromRawMap(jsonObject);
    } else {
      print('getting rates from cache');
    }
    return _rateCache;
  }

  List<Rate> _createRateListFromRawMap(Map jsonObject) {
    final Map rates = jsonObject['rates'];
    final String base = jsonObject['base'];
    List<Rate> list = [];

    // include the base currency in the list
    list.add(Rate(baseCurrency: base, quoteCurrency: base, exchangeRate: 1.0));

    // add all of the quote currency conversion rates
    for (var rate in rates.entries) {
      list.add(Rate(baseCurrency: base,
          quoteCurrency: rate.key,
          exchangeRate: rate.value as double));
    }

    return list;
  }
}
