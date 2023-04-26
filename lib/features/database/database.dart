import 'package:flashcards/features/home/entity/flashcard_entity.dart';
import 'package:flashcards/features/home/models/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FlashcardDatabase{


  static const _databaseName = 'flashcards_db';
  static const _tableName = 'flashcards';
  static const _columnId = 'id';
  static const _frontPage = 'front_page';
  static const _backPage = 'back_page';


  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }





  Future<FlashcardListEntity> allFlashcards() async{
    final db = await database;
    return db.query(_tableName);
  }

  Future<void> insertFlashcard(Flashcard flashcard) async {
    final db = await database;
    await db.insert(_tableName, flashcard.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
      );
  }


  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_frontPage TEXT NOT NULL,
            $_backPage TEXT NOT NULL,
          )
        ''');
      },
    );
  }
}