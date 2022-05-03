import 'condition.dart';

class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  Day(
      {required this.maxtempC,
      required this.maxtempF,
      required this.mintempC,
      required this.mintempF,
      required this.avgtempC,
      required this.avgtempF,
      required this.maxwindMph,
      required this.maxwindKph,
      required this.totalprecipMm,
      required this.totalprecipIn,
      required this.avgvisKm,
      required this.avgvisMiles,
      required this.avghumidity,
      required this.dailyWillItRain,
      required this.dailyChanceOfRain,
      required this.dailyWillItSnow,
      required this.dailyChanceOfSnow,
      required this.condition,
      required this.uv});

  Day.fromJson(Map<String, dynamic> json)
      : maxtempC = json['maxtemp_c'],
        maxtempF = json['maxtemp_f'],
        mintempC = json['mintemp_c'],
        mintempF = json['mintemp_f'],
        avgtempC = json['avgtemp_c'],
        avgtempF = json['avgtemp_f'],
        maxwindMph = json['maxwind_mph'],
        maxwindKph = json['maxwind_kph'],
        totalprecipMm = json['totalprecip_mm'],
        totalprecipIn = json['totalprecip_in'],
        avgvisKm = json['avgvis_km'],
        avgvisMiles = json['avgvis_miles'],
        avghumidity = json['avghumidity'],
        dailyWillItRain = json['daily_will_it_rain'],
        dailyChanceOfRain = json['daily_chance_of_rain'],
        dailyWillItSnow = json['daily_will_it_snow'],
        dailyChanceOfSnow = json['daily_chance_of_snow'],
        condition = json['condition'] = Condition.fromJson(json['condition']),
        uv = json['uv'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxtemp_c'] = maxtempC;
    data['maxtemp_f'] = maxtempF;
    data['mintemp_c'] = mintempC;
    data['mintemp_f'] = mintempF;
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    data['maxwind_mph'] = maxwindMph;
    data['maxwind_kph'] = maxwindKph;
    data['totalprecip_mm'] = totalprecipMm;
    data['totalprecip_in'] = totalprecipIn;
    data['avgvis_km'] = avgvisKm;
    data['avgvis_miles'] = avgvisMiles;
    data['avghumidity'] = avghumidity;
    data['daily_will_it_rain'] = dailyWillItRain;
    data['daily_chance_of_rain'] = dailyChanceOfRain;
    data['daily_will_it_snow'] = dailyWillItSnow;
    data['daily_chance_of_snow'] = dailyChanceOfSnow;
    data['condition'] = condition.toJson();
    data['uv'] = uv;
    return data;
  }
}
