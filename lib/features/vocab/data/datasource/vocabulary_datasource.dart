import 'package:my_vocability/core/network/api_exception.dart';
import 'package:my_vocability/core/network/api_handler.dart';

class VocabularyDataSource {
  final ApiHandler api;

  VocabularyDataSource(this.api);

  Future<void> fetchWordPhoneTic(String word) async {
    try {
      final responseData = await api.get('/v2/entries/en/$word');
      print("response: ${responseData.toString()}");
    } on ApiException catch (e) {
      print(e.message);
    }
  }

}