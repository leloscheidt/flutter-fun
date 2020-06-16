import 'dart:async';

import 'package:dogapi/i18n/messages.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final Set<String> locales = Set.from(['en', 'pt']);

class CustomLocalization {
  final Locale locale;

  CustomLocalization(this.locale);

  static CustomLocalization of(BuildContext context) {
    return Localizations.of<CustomLocalization>(context, CustomLocalization);
  }

  String get(String key) {
    return Messages.get(locale.languageCode, key);
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalization> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locales.contains(locale.languageCode);

  @override
  Future<CustomLocalization> load(Locale locale) {
    return SynchronousFuture<CustomLocalization>(CustomLocalization(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

List<Locale> supported() {
  final List<Locale> supported = [];
  locales.forEach((element) {
    supported.add(Locale(element, ''));
  });
  return supported;
}

List<LocalizationsDelegate> delegates() {
  return [
    const DemoLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}
