import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

class Connexion{

  openDataBase(){
    final path = 'database/sharemycode.db';
    var db = sqlite3.open(path);
    db.execute('INSERT INTO users (name, password, created_at, updated_at) VALUES ("test", "test12345", "", "")');
    final ResultSet resultSet = db.select('SELECT * FROM users');
    print(resultSet);
    db.dispose();
  }

  insertData(){
    final path = 'database/sharemycode.db';
    var db = sqlite3.open(path);

  }
}

void main(){
  Connexion().openDataBase(); 
}