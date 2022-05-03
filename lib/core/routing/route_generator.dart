import 'package:flutter/material.dart';
import 'package:weather_app/presentation/pages/splash_page.dart';

import 'routes.dart';

class RouteGenerator {
  static final errorPage = MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Text('Error'),
    );
  });

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPageRoute:
        return MaterialPageRoute(
          builder: (_) {
            return const SplashPage();
          },
          settings: const RouteSettings(name: splashPageRoute),
        );

      default:
        return errorPage;
    }
  }
}
