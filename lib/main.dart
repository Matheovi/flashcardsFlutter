import 'package:flashcards/features/home/screens/home_screen.dart';
import 'package:flashcards/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'flashcards_database.db'),
    onCreate: (db, version){
      return db.execute('CREATE TABLE flashcard(id INTEGER PRIMARY KEY, frontPage TEXT, backPage TEXT)');
    }
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcards',
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}