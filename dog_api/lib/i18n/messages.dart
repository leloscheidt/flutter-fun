import 'package:dogapi/i18n/resources/en.dart' as en;
import 'package:dogapi/i18n/resources/pt.dart' as pt;

class Messages {
  static final Map<String, Map<String, String>> messages = {
    'en': en.messages,
    'pt': pt.messages,
  };

  static String get(String lang, String key) {
    return messages[lang][key];
  }
}
