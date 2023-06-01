import 'package:get/get.dart';
import 'en.dart';
import 'km.dart';


class Translator extends Translations {
  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translationsKeys;

  static const langList = [
    {
      'code': 'km',
      'khmerName': 'ភាសាខ្មែរ',
      'englishName': 'Khmer',
    },
    {
      'code': 'en',
      'khmerName': 'អង់គ្លេស',
      'englishName': 'English',
    }
  ];
}

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": English.lang,
    "km": Khmer.lang,
  };
}
