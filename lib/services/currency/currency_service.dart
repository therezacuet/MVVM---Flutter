import 'package:mvvm_flutter_app/business_logic/models/currency.dart';
import 'package:mvvm_flutter_app/business_logic/models/rate.dart';

abstract class CurrencyService {
  Future<List<Rate>> getAllExchangeRates({String base});

  Future<List<Currency>> getFavoriteCurrencies();

  Future<void> saveFavoriteCurrencies(List<Currency> data);
}

