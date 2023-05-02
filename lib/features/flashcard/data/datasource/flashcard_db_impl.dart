import 'package:flashcards/features/flashcard/data/datasource/flashcard_db.dart';
import 'package:flashcards/features/flashcard/data/model/flashcard_model.dart';
import 'package:flashcards/features/flashcard/domain/entity/flashcard.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FlashcardDbImpl implements FlashcardDb {
  static const _databaseName = 'flashcard_db';
  static const _tableName = 'flashcard_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnFront = 'front';
  static const _columnBack = 'back';
  static sql.Database? _database;

  Future<sql.Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<sql.Database> _initDatabase() async {
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnFront TEXT NOT NULL,
            $_columnBack TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<FlashcardModel> insert(final Flashcard entity) async {
    print(entity);
    final db = await database;
    late final FlashcardModel resultModel;
    await db.transaction((txn) async {
      final id = await txn.insert(
        _tableName,
        FlashcardModel.toJson(entity),
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      final results = await txn.query(
        _tableName,
        where: '$_columnId = ?',
        whereArgs: [id],
      );
      resultModel = FlashcardModel.fromJson(results.first);
    });
    print(resultModel);
    return resultModel;
  }
}