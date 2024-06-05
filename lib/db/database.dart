// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class Repository {
  static const dbFile = "gastro_galaxy.db";
  static const version = 1;

  static late Database _db;
  static const devMode = true;

  initDb() async {
    String dbPath = await getDatabasesPath();
    String path = p.join(dbPath, dbFile);

    _db = await openDatabase(path, version: version, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    if (devMode) {
      await db.execute('DROP TABLE IF EXISTS Profile');
    }

    await db.execute('''CREATE TABLE Profile (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      phone TEXT,
      password TEXT,
      image TEXT NULLABLE,
      )
    ''');

    await db.execute('INSERT INTO Category (id, name, email, phone, password) VALUES (1, \'Leonardo Bitencourt\', \'leonardobitencourt2020@gmail.com\', \'54992510981\', \'12345678\')');

    Future<int> insertUser(Map<String, dynamic> row) async {
      await initDb();
      return await _db.insert('Profile', row);
    }

    Future<int> updateUser(Map<String, dynamic> row) async {
      await initDb();

      return await _db.update('Profile', row, where: 'id = ?', whereArgs: [row['id']]);
    }

    Future<int> deleteUser(int id) async {
      await initDb();
      return await _db.delete('Profile', where: 'id = ?', whereArgs: [id]);
    }
  }
}
