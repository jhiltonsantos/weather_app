// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_app/data/api/repositories/weather_repository.dart';
import 'package:weather_app/domain/entities/forecast_day.dart';
import 'package:weather_app/presentation/pages/splash_page.dart';

import 'presentation/components/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WeatherRepository weatherRepository = WeatherRepository();
  List<Forecastday> list =
      await weatherRepository.getWeatherFutureData('Teresina', 2);
  print('Lista de Forecast: ${list[0].date}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: weatherTheme,
      home: const SplashPage(),
    );
  }
}
