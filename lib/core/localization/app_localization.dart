import 'package:boujee/core/localization/dart_files/messages_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class AppLocalization {
  final Locale locale;

  const AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization);

  static Future<AppLocalization> load(Locale locale) async {
    final String localeName = Intl.canonicalizedLocale(locale.languageCode);

    await initializeMessages(localeName);

    Intl.defaultLocale = localeName;

    return AppLocalization(locale);
  }

  String get foodForEveryone => Intl.message(
        "Food for\nEveryone",
        name: "foodForEveryone",
      );
  String get getStarted => Intl.message(
        "Get started",
        name: "getStarted",
      );
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) => ["en", "fr"].contains(locale.languageCode);
  @override
  Future<AppLocalization> load(Locale locale) =>
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> d) => false;
}
