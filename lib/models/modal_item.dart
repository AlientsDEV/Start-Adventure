
import 'package:cloud_firestore/cloud_firestore.dart';

class ModalItem {

  final String index;
  final String title;
  final String text;
  final String photoUrl;
  final String rating;
  final String nbrRating;

  ModalItem({
    this.index,
    this.title,
    this.text,
    this.photoUrl,
    this.rating,
    this.nbrRating
  });


  factory ModalItem.fromDocument(DocumentSnapshot doc){
    return ModalItem(
      photoUrl: doc['photoUrl'],
      title: doc['title'],
      text: doc['text'],
      index: doc['index'],
      nbrRating: doc['nbrRating'],
      rating: doc['rating']
    );
  }

}