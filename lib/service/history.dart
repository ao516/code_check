//検索履歴を保管するサービス
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//履歴を管理するプロバイダー
class HistoryNotifier extends AsyncNotifier<List<String>> {
  final _service = HistoryService();

  @override
  Future<List<String>> build() async {
    return await _service.getKeywords();
  }

  Future<void> addKeyword(String keyword) async {
    await _service.addKeyword(keyword);
    ref.invalidateSelf(); // 状態を再取得
  }

  Future<void> clearHistory() async {
    await _service.clearHistory();
    ref.invalidateSelf(); // 状態を再取得
  }
  Future<void> removeKeyword(String keyword) async {
    await _service.removeKeyword(keyword);
    ref.invalidateSelf(); // 状態を再取得
  }
}
final historyProvider = AsyncNotifierProvider<HistoryNotifier, List<String>>(() {
  return HistoryNotifier();
});

class HistoryService {
  static const String _tableName = 'search_history';
  static const String _columnId = 'id';
  static const String _columnKeyword = 'keyword';
  static final HistoryService _instance = HistoryService._internal();
  HistoryService._internal();
  factory HistoryService() {
    return _instance;
  }

  Future<Database> get db async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), 'history.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE $_tableName('
            '$_columnId INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$_columnKeyword TEXT NOT NULL UNIQUE'
            ');',
          );
        },
        version: 1,
      );
    } catch (e) {
      throw Exception('Failed to open database: $e');
    }
  }

  Future<void> addKeyword(String keyword) async {
    final Database database = await db;
    await database.insert(
      _tableName,
      {_columnKeyword: keyword},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<String>> getKeywords() async {
    final Database database = await db;
    final List<Map<String, dynamic>> maps = await database.query(_tableName);
    return List.generate(maps.length, (i) => maps[i][_columnKeyword] as String);
  }

  Future<void> clearHistory() async {
    final Database database = await db;
    await database.delete(_tableName);
  }

  Future<void> removeKeyword(String keyword) async {
    final Database database = await db;
    await database.delete(
      _tableName,
      where: '$_columnKeyword = ?',
      whereArgs: [keyword],
    );
  }
}