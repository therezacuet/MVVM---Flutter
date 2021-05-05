
import 'package:mvvm_flutter_app/business_logic/models/rate.dart';

abstract class WebApi {
  Future<List<Rate>> fetchExchangeRates();
}