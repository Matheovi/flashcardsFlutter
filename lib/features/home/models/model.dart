import 'package:flashcards/features/home/entity/flashcard_entity.dart';

class Flashcard {

  final int id;
  final String frontPage;
  final String backPage;

  Flashcard({
    required this.id,
    required this.frontPage,
    required this.backPage,
  });


  //function used when querying from the database
  factory Flashcard.fromMap(FlashcardEntity json) => Flashcard(
    id: json["id"],
    frontPage: json["front_page"],
    backPage: json["back_page"],
  );

  //function used to insert to database
  FlashcardEntity toMap() => {
    "id": id,
    "front_page": frontPage,
    "back_page": backPage,
  };


  


}
