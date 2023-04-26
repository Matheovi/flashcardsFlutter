import 'model.dart';

class FlashcardsList{
  FlashcardsList({required List<Flashcard> values}){
    var list = [];
    for(var item in values){
      list.add(item);
    }
  }
}