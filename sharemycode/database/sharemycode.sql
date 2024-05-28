CREATE TABLE users(
   id_users INTEGER PRIMARY KEY AUTOINCREMENT,
   name VARCHAR(50),
   password TEXT,
   created_at DATE NOT NULL,
   updated_at DATE NOT NULL,
);

CREATE TABLE contents(
   id_contents INTEGER PRIMARY KEY AUTOINCREMENT,
   content TEXT NOT NULL,
   langage TEXT NOT NULL,
   expiration DATE,
   created_at DATE NOT NULL,
   updated_at DATE NOT NULL,
   id_users INT,
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE logs(
   id_logs INTEGER PRIMARY KEY AUTOINCREMENT,
   created_at DATE,
   id_contents INT NOT NULL,
   id_users INT NOT NULL,
   PRIMARY KEY(id_logs),
   FOREIGN KEY(id_contents) REFERENCES contents(id_contents),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);