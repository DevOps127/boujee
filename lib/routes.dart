import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:boujee/ui/screens/connexion/connexion_screen.dart';
import 'package:boujee/ui/screens/onboarding_screen.dart';

class RouteGenerator {
  static const String onboardingScreen = '/';

  static const String connexionScreen = '/connexion-screen';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const OnboardingScreen(),
        );
      case connexionScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ConnexionScreen(),
        );
      default:
        throw FormatException('Page not found');
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException({this.message});
}
