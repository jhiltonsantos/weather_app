// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/api/repositories/weather_repository.dart';
import 'package:weather_app/data/sqlite_db/dao/weather_dao.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/entities/weather_location.dart';
import 'package:weather_app/presentation/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  WeatherRepository weatherRepository = WeatherRepository();
  LocationDAO locationDAO = LocationDAO();

  void getLocationData() async {
    List<WeatherLocation> location = await locationDAO.findAll();
    if (location[0].id == null) {
      late Position currentPosition;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best,
              forceAndroidLocationManager: true)
          .then((Position position) {
        currentPosition = position;
      }).catchError((e) => print(e));

      locationDAO.save(WeatherLocation(0, currentPosition.latitude.toString(),
          currentPosition.longitude.toString()));
      print("Salvando nova localização");
    }

    Weather weather = await weatherRepository.getWeatherByLocation(
        lat: location[0].latitude.toString(),
        lon: location[0].longitude.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(weather: weather);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
