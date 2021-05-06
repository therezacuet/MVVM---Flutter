

// This is not used in the final app, but I am leaving it in to show how you
// could use fake data during development. This lets you work on your core business
// logic without worrying about the details of how you retrieve data from the
// web. It also lets you work when you don't have an internet connection.
import 'package:mvvm_flutter_app/business_logic/models/rate.dart';

import 'web_api.dart';

class FakeWebApi implements WebApi {

  @override
  Future<List<Rate>> fetchExchangeRates() async {
    List<Rate> list = [];
    list.add(Rate(
      baseCurrency: 'USD',
      quoteCurrency: 'EUR',
      exchangeRate: 0.91,
    ));
    list.add(Rate(
      baseCurrency: 'USD',
      quoteCurrency: 'CNY',
      exchangeRate: 7.05,
    ));
    list.add(Rate(
      baseCurrency: 'USD',
      quoteCurrency: 'MNT',
      exchangeRate: 2668.37,
    ));
    return list;
  }

}
