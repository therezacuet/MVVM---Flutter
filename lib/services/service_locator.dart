import 'currency/currency_service_implementation.dart';
import 'web_api/web_api.dart';
import 'web_api/web_api_fake.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_flutter_app/business_logic/view_models/calculate_screen_viewmodel.dart';
import 'package:mvvm_flutter_app/business_logic/view_models/choose_favorite_viewmodel.dart';

GetIt serviceLocator = GetIt.instance;
serviceLocator.registerLazySingleton<WebApi>(() => FakeWebApi());

void setupServiceLocator() {

  serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());

  serviceLocator.registerFactory<CalculateScreenViewModel>(() => CalculateScreenViewModel());
  serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}