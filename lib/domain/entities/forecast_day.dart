import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class Forecastday {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  Forecastday(
      {required this.date,
      required this.dateEpoch,
      required this.day,
      required this.astro,
      required this.hour});

  Forecastday.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        dateEpoch = json['date_epoch'],
        day = json['day'] = Day.fromJson(json['day']),
        astro = json['astro'] = Astro.fromJson(json['astro']),
        hour = json['hour'] = newHour(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    data['day'] = day.toJson();
    data['astro'] = astro.toJson();
    data['hour'] = hour.map((v) => v.toJson()).toList();
    return data;
  }
}

List<Hour> newHour(Map<String, dynamic> json) {
  List<Hour> hour = <Hour>[];
  json['hour'].forEach((v) {
    hour.add(Hour.fromJson(v));
  });
  return hour;
}
