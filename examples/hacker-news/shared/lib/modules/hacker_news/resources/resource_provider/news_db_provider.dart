import 'package:shared/modules/hacker_news/models/news_models_public.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'dart:io';

import '../news_repository.dart';

class NewsDbProvider implements Source, Cache {
  Database db;

  NewsDbProvider() {
    init();
  }

  Future<List<int>> fetchTopId() {
    return null;
  }

  void init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'items.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      newDb.execute("""
            CREATE TABLE Items  
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
          """);
    });
  }

  Future<NewsItemModel> fetchItems(int id) async {
    final map = await db.query(
      'Items',
      columns: null,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (map.length > 0) {
      return NewsItemModel.fromDb(map.first);
    }
    return null;
  }

  Future<int> addItem(NewsItemModel items) {
    return db.insert('Items', items.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<int> clear() {
    return db.delete('Items');
  }
}

final newsDbProvider = NewsDbProvider();
