// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../models/profile.dart';

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
      image TEXT NULLABLE,
      name TEXT,
      email TEXT,
      phone TEXT,
      password TEXT
      )
    ''');

    await db.execute('INSERT INTO Profile (id, name, email, phone, password) VALUES (1, \'Leonardo Bitencourt\', \'leonardobitencourt2020@gmail.com\', \'54992510981\', \'12345678\')');
  }

  Future<List<Profile>> getProfile() async {
    await initDb();

    final List<Map<String, Object?>> profiles = await _db.query('Profile');

    return [
      for (final p in profiles)
        Profile(
          id: p["id"] as int,
          image: p["image"] != null ? p["image"] as String : "",
          name: p["name"] as String,
          email: p["email"] as String,
          phone: p["phone"] as String,
          password: p["phone"] as String,
        ),
    ];
  }

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
