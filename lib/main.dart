import 'package:flutter/material.dart';

import 'alert.dart';
import 'database_helper.dart';
import 'user.dart';

List _users;

void main() async {
  var db = new DatabaseHelper();

  //Add user
  await db.saveUser(new User("Kris Andrews", "programmer"));

  int count = await db.getCount();
  print("Count: $count");

  //Retrieving a user
  User Kris = await db.getUser(1);
  User anaUpdated = User.fromMap(
      {"username": "Kris Andrews", "password": "programmer", "id": 1});

  //Update
  await db.updateUser(anaUpdated);

  //Delete a User
  // int userDeleted = await db.deleteUser(2);

  // print("Delete User:  $userDeleted");

  //Get all users;
  _users = await db.getAllUsers();
  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);

    print("Username: ${user.username}, User Id: ${user.id}");
  }

  runApp(new MaterialApp(
    title: "Database",
    debugShowCheckedModeBanner: false,
    home: new DatabaseApp(),
  ));
}

class DatabaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new ListView.builder(
          itemCount: _users.length,
          itemBuilder: (_, int position) {
            return new Card(
              color: Colors.white,
              elevation: 2.0,
              child: new ListTile(
                leading: new CircleAvatar(child: Icon(Icons.tag_faces)),
                title: new Text(
                    "User: ${User.fromMap(_users[position]).username}"),
                subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),
                onTap: () {
                  showAlertMessage(
                      context, "${User.fromMap(_users[position]).password}");
                },

                //() =>
                //debugPrint("${User.fromMap(_users[position]).password}"),
              ),
            );
          }),
    );
  }
}
