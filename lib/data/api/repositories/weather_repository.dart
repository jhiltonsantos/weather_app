import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/domain/entities/forecast_day.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/i_weather_repository.dart';

import '../web_client.dart';

class WeatherRepository implements IWeatherRepository {
  @override
  Future<Weather> getWeatherByCity(String location) async {
    final http.Response response = await client
        .get(Uri.parse('$baseUrlWithApi&q=$location&days=10&aqi=no&alerts=no'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar clima');
    }
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return Weather.fromJson(decodedJson);
  }

  @override
  Future<Weather> getWeatherByLocation(
      {required String lat, required String lon}) async {
    final http.Response response = await client
        .get(Uri.parse('$baseUrlWithApi&q=$lat,$lon&days=10&aqi=no&alerts=no'));
    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar clima');
    }
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return Weather.fromJson(decodedJson);
  }

  @override
  Future<List<Forecastday>> getWeatherFutureData(
      String location, int page) async {
    final http.Response response = await client.get(
        Uri.parse('$baseUrlWithApi&q=$location&days=$page&aqi=no&alerts=no'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar clima');
    }
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    Weather weather = Weather.fromJson(decodedJson);
    final List<Forecastday> forecastList = [];
    for (int index = 0; index < weather.forecast.forecastday.length; index++) {
      forecastList.add(weather.forecast.forecastday[index]);
    }
    return forecastList;
  }
}
