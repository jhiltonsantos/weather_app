import 'package:weather_app/domain/entities/forecast_day.dart';
import 'package:weather_app/domain/entities/weather.dart';

abstract class IWeatherRepository {
  Future<Weather> getWeatherByLocation(
      {required String lat, required String lon});
  Future<Weather> getWeatherByCity(String location);
  Future<List<dynamic>> getWeatherFutureData(String location, int page);
}
