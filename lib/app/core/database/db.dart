
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  
  DB._();
  //Criar uma instancia de DB

  static final DB instance = DB._();

  //Instancia do SQLite
  static Database? _database;


  get database async {
    if(_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'economy.db'),
      version: 2,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version)async {
    await db.execute(_bill);
    await db.execute(_wallet);
  }

  // quantidade TEXT -> depois converte para double
  String get _bill => '''
    CREATE TABLE bill (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      description TEXT NOT NULL,
      value REAL NOT NULL,
      expireIn DATETIME NOT NULL,
      observation TEXT NOT NULL,
      category INTEGER NOT NULL,
      discount REAL NOT NULL,
      paidOut INTEGER NOT NULL
    );
  ''';

  String get _wallet => '''
    CREATE TABLE wallet (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      value REAL NOT NULL
    );
''';
  
}




