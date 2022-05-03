import 'condition.dart';

class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;

  Hour(
      {required this.timeEpoch,
      required this.time,
      required this.tempC,
      required this.tempF,
      required this.isDay,
      required this.condition,
      required this.windMph,
      required this.windKph,
      required this.windDegree,
      required this.windDir,
      required this.pressureMb,
      required this.pressureIn,
      required this.precipMm,
      required this.precipIn,
      required this.humidity,
      required this.cloud,
      required this.feelslikeC,
      required this.feelslikeF,
      required this.windchillC,
      required this.windchillF,
      required this.heatindexC,
      required this.heatindexF,
      required this.dewpointC,
      required this.dewpointF,
      required this.willItRain,
      required this.chanceOfRain,
      required this.willItSnow,
      required this.chanceOfSnow,
      required this.visKm,
      required this.visMiles,
      required this.gustMph,
      required this.gustKph,
      required this.uv});

  Hour.fromJson(Map<String, dynamic> json)
      : timeEpoch = json['time_epoch'],
        time = json['time'],
        tempC = json['temp_c'],
        tempF = json['temp_f'],
        isDay = json['is_day'],
        condition = json['condition'] = Condition.fromJson(json['condition']),
        windMph = json['wind_mph'],
        windKph = json['wind_kph'],
        windDegree = json['wind_degree'],
        windDir = json['wind_dir'],
        pressureMb = json['pressure_mb'],
        pressureIn = json['pressure_in'],
        precipMm = json['precip_mm'],
        precipIn = json['precip_in'],
        humidity = json['humidity'],
        cloud = json['cloud'],
        feelslikeC = json['feelslike_c'],
        feelslikeF = json['feelslike_f'],
        windchillC = json['windchill_c'],
        windchillF = json['windchill_f'],
        heatindexC = json['heatindex_c'],
        heatindexF = json['heatindex_f'],
        dewpointC = json['dewpoint_c'],
        dewpointF = json['dewpoint_f'],
        willItRain = json['will_it_rain'],
        chanceOfRain = json['chance_of_rain'],
        willItSnow = json['will_it_snow'],
        chanceOfSnow = json['chance_of_snow'],
        visKm = json['vis_km'],
        visMiles = json['vis_miles'],
        gustMph = json['gust_mph'],
        gustKph = json['gust_kph'],
        uv = json['uv'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time_epoch'] = timeEpoch;
    data['time'] = time;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    data['condition'] = condition.toJson();
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoint_c'] = dewpointC;
    data['dewpoint_f'] = dewpointF;
    data['will_it_rain'] = willItRain;
    data['chance_of_rain'] = chanceOfRain;
    data['will_it_snow'] = willItSnow;
    data['chance_of_snow'] = chanceOfSnow;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    data['uv'] = uv;
    return data;
  }
}
