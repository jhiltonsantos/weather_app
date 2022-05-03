import 'package:weather_app/domain/entities/weather_location.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class LocationDAO {
  static const String _tableName = 'location';
  static const String _id = 'id';
  static const String _latitude = 'latitude';
  static const String _longitude = 'longitude';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_latitude TEXT, '
      '$_longitude TEXT)';

  Future<int> save(WeatherLocation locationWeather) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> locationMap = {};
    locationMap[_id] = locationWeather.id;
    locationMap[_latitude] = locationWeather.latitude;
    locationMap[_longitude] = locationWeather.longitude;
    return db.insert(_tableName, locationMap,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<WeatherLocation>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<WeatherLocation> locations = [];
    for (Map<String, dynamic> row in result) {
      final WeatherLocation location =
          WeatherLocation(row[_id], row[_latitude], row[_longitude]);
      locations.add(location);
    }
    return locations;
  }
}
