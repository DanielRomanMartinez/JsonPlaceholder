import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:json_placeholder/domain/services/sqlite_service.dart';
import 'package:json_placeholder/infrastructure/repositories/comments_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

@LazySingleton(as: SqliteService)
class SqfliteService implements SqliteService {
  late Database database;
  SqfliteService();

  @override
  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'json_placeholder.db');

    await deleteDatabase(path);
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE ${SqliteCommentsRepository.commentsTable}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, postId INTEGER, name TEXT, email TEXT, body TEXT)',
        );
      },
    );
    debugPrint('Database initialized');
  }

  @override
  Future<void> insert(
    String table,
    Map<String, Object?> values,
  ) async {
    await database.insert(
      table,
      values,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Map<String, Object?>>> get(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    return await database.query(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<void> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await database.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<void> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await database.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }
}
