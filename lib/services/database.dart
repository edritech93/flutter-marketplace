import 'dart:async';

import 'package:balila_mobile/model/model_fetch.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/index.dart';
import '../model/model_dog.dart';

class Database {
  Future<dynamic> getDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $TABLE_FETCH (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, url TEXT, body TEXT, response TEXT)',
        );
        await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
    return database;
  }

  // NOTE: CRUD TABLE_FETCH

  Future<void> insertFetch(ModelFetch modelFetch) async {
    final db = await getDatabase();
    await db.insert(
      TABLE_FETCH,
      modelFetch.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ModelFetch>> getFetch() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TABLE_FETCH);
    return List.generate(maps.length, (i) {
      return ModelFetch(
        url: maps[i]['url'],
        body: maps[i]['body'],
        response: maps[i]['response'],
      );
    });
  }

  Future<void> updateFetch(ModelFetch modelFetch) async {
    final db = await getDatabase();
    await db.update(
      TABLE_FETCH,
      modelFetch.toMap(),
      where: 'url = ? and body = ?',
      whereArgs: [modelFetch.url, modelFetch.body],
    );
  }

  Future<void> deleteAllFetch() async {
    final db = await getDatabase();
    await db.delete(TABLE_FETCH);
  }

  // NOTE: CRUD Example

  Future<void> insertDog(Dog dog) async {
    final db = await getDatabase();
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> getDogs() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> updateDog(Dog dog) async {
    final db = await getDatabase();
    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    final db = await getDatabase();
    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
