import 'package:flashcards/features/flashcard/data/datasource/flashcard_database.dart';
import 'package:flashcards/features/flashcard/data/error/flashcard_database_error.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FlashcardDatabaseImpl implements FlashcardDatabase {
  static const _databaseName = 'flashcard_db';
  static const _tableName = 'flashcard_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnFront = 'front';
  static const _columnBack = 'back';
  static sql.Database? _database;

  /// Opens the [_databaseName] database if not opened yet and returns a handle to it.
  Future<sql.Database> get database async {
    _database ??= await sql.openDatabase(
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
    return _database!;
  }

  @override
  Future<Either<FlashcardDatabaseError, void>> put(final Map<String, dynamic> json) async {
    final db = await database;
    try {
      await db.insert(
        _tableName,
        json,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      return Either.right(null);
    } on sql.DatabaseException catch (e) {
      return Either.left(FlashcardDatabaseError(
        message: 'An error has occured while inserting the data.',
        details: e.toString(),
      ));
    }
  }
  
  @override
  Future<Either<FlashcardDatabaseError, void>> delete(final int id) async {
    final db = await database;
    try {
      await db.delete(
        _tableName,
        where: '$_columnId = ?',
        whereArgs: [id],
      );
      return Either.right(null);
    } on sql.DatabaseException catch (e) {
      return Either.left(FlashcardDatabaseError(
        message: 'An error has occurred while deleting the data.',
        details: e.toString(),
      ));
    }
  }
  
  @override
  Future<Either<FlashcardDatabaseError, void>> update(final Map<String, dynamic> json) async {
    final db = await database;
    final int id = json['id'];
    try {
      await db.update(
        _tableName,
        json,
        where: '$_columnId = ?',
        whereArgs: [id],
      );
      return Either.right(null);
    } on sql.DatabaseException catch (e) {
      return Either.left(FlashcardDatabaseError(
        message: 'An erorr has occurred while updating the data.',
        details: e.toString(),
      ));
    }
  }
}