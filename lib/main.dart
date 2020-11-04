import 'package:boujee/core/localization/app_localization.dart';
import 'package:boujee/routes.dart';
import 'package:boujee/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boujee',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      localizationsDelegates: [
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale.fromSubtags(languageCode: "en"),
        Locale.fromSubtags(languageCode: "it"),
      ],
      onGenerateTitle: (context) => 'Boujee',
      navigatorKey: RouteGenerator.key,
      initialRoute: RouteGenerator.onboardingScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
