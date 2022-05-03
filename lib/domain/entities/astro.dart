class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final String moonIllumination;

  Astro(
      {required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      required this.moonPhase,
      required this.moonIllumination});

  Astro.fromJson(Map<String, dynamic> json)
      : sunrise = json['sunrise'],
        sunset = json['sunset'],
        moonrise = json['moonrise'],
        moonset = json['moonset'],
        moonPhase = json['moon_phase'],
        moonIllumination = json['moon_illumination'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moonPhase;
    data['moon_illumination'] = moonIllumination;
    return data;
  }
}
