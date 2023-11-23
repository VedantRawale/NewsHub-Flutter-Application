import 'package:firebase_database/firebase_database.dart';
import '../constants.dart';
import 'api_services.dart';
import 'dart:convert';

Future<void> addarticletofav(Articles articles) async {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('users/$usrId').child('favourites');
  // Convert Articles object to JSON
  final Map<String, dynamic> articlesMap = articles.toJson();

  // Convert the map to a JSON-encoded string
  final String articlesJson = jsonEncode(articlesMap);

  // Add the serialized data to Firebase
  databaseReference.push().set(articlesJson);
}

Future<List<Articles>> getFavArticles() async {
  List<Articles> articleList = [];
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('users/$usrId').child('favourites');
  DatabaseEvent databaseEvent = await databaseReference.once();
  DataSnapshot dataSnapshot = databaseEvent.snapshot;
  if (dataSnapshot.value != null) {
    final Map<dynamic, dynamic> articleMap =
        dataSnapshot.value as Map<dynamic, dynamic>;

    articleMap.forEach((key, value) {
      Map<String, dynamic> val = jsonDecode(value) as Map<String,dynamic>;
      articleList.add(Articles.fromJson(val));
    });
  }
  return articleList;
}
