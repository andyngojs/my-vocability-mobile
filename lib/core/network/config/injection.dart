import 'package:get_it/get_it.dart';
import 'package:my_vocability/core/network/api_handler.dart';

final GetIt getIt = GetIt.instance();

void setupLocator() {
  getIt.registerLazySingleton(() => ApiHandler(baseUrl: 'https://api.dictionaryapi.dev/api'));
}
