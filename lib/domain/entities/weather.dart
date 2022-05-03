import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class Weather {
  final Location location;
  final Current current;
  final Forecast forecast;

  const Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  Weather.fromJson(Map<String, dynamic> json)
      : location = json['location'] = Location.fromJson(json['location']),
        current = json['current'] = Current.fromJson(json['current']),
        forecast = json['forecast'] = Forecast.fromJson(json['forecast']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location.toJson();
    data['current'] = current.toJson();
    data['forecast'] = forecast.toJson();
    return data;
  }
}
