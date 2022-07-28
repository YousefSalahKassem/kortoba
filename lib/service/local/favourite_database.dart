import 'package:flutter/cupertino.dart';
import 'package:kortoba/model/local/local_post_model.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavouriteDatabase{
  FavouriteDatabase._();

  static final FavouriteDatabase db = FavouriteDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    debugPrint('AppDatabaseInitialized');

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'favourite.db');
    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onOpen: onOpen);
  }

  _onCreate(Database db, int version) async {
    debugPrint('_onCreate');
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        $columnId TEXT,
        $columnCaption TEXT,
        $columnImage TEXT,
        $columnName TEXT,
        $columnFavourite TEXT,
        $columnProfileImage TEXT,
        $columnEmail TEXT,
        $columnLikes TEXT
      )
    ''');
  }

  onOpen(Database db) async {
    _database = db;
  }

  insertPost(LocalPostModel post) async {
    final db = await database;
    await db!.insert(tableName, post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<LocalPostModel>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(tableName);
    return List.generate(maps.length, (i) {
      return LocalPostModel(
        id: maps[i][columnId] as String,
        caption: maps[i][columnCaption] as String,
        image: maps[i][columnImage] as String,
        name: maps[i][columnName] as String,
        favourite: maps[i][columnFavourite] as String,
        profileImage: maps[i][columnProfileImage] as String,
        email: maps[i][columnEmail] as String,
        likes: maps[i][columnLikes] as String
      );
    });
  }

  Future<int> deletePost(String id) async {
    final db = await database;
    return await db!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updatePost(LocalPostModel post) async {
    final db = await database;
    return await db!.update(tableName, post.toJson(),
        where: '$columnId = ?', whereArgs: [post.id]);
  }

}