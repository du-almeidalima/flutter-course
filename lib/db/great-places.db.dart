import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart' as path;

class GreatPlacesDB {
  static const String _PLACES_TABLE = 'places';

  static Future<sqflite.Database> database() async {
    // Each OS has its own locations for a DB, this methods abstract this for us
    final dbPath = await sqflite.getDatabasesPath();
    // This will go to the specified path, if it finds a file with this name, it's
    // going to open it, otherwise it'll create
    return await sqflite.openDatabase(
      path.join(dbPath, 'great_places.db'),
      // Callback called when openDatabase doesn't find a file
      onCreate: (db, version) {
        db.execute('CREATE TABLE $_PLACES_TABLE('
            'id TEXT PRIMARY KEY,'
            'title TEXT,'
            'image TEXT,'
            'loc_lat REAL,loc_lng REAL'
          ')'
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(Map<String, Object> data) async {
    final db = await GreatPlacesDB.database();
    await db.insert(
      _PLACES_TABLE,
      data,
      // If it finds a row with the given id, It'll replace
      conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> get() async {
    final db = await GreatPlacesDB.database();
    return db.query(_PLACES_TABLE);
  }
}
