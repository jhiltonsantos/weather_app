import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/data/sqlite_db/dao/weather_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'location.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(LocationDAO.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
