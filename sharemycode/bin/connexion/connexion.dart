import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

class Connexion{

  // openDataBase(){
  //   var db = sqlite3.openInMemory();
  //   var results = db.select('SELECT * FROM contents');
  //   for (var element in results) {
  //     print('ID: ${element['id_contents']}');
  //   }

  //   db.dispose();
  // }


}
  void main(){
    String path = '../../database/sharemycode.db';
    var db = sqlite3.open(path);
    var results = db.select('SELECT * FROM contents');
    for (var element in results) {
      print('ID: ${element['id_contents']}');
    }

    db.dispose();
  }