class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  Location(
      {required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required  this.lon,
        required this.tzId,
        required  this.localtimeEpoch,
        required this.localtime});

  Location.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        region = json['region'],
        country = json['country'],
        lat = json['lat'],
        lon = json['lon'],
        tzId = json['tz_id'],
        localtimeEpoch = json['localtime_epoch'],
        localtime = json['localtime'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tzId': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime
      };
}
