import 'package:flutter/material.dart';
import 'logout_button.dart';

class UserManagementScreen extends StatelessWidget {
  final List<User> users = [
    User(name: 'John Doe', email: 'john.doe@example.com'),
    User(name: 'Jane Smith', email: 'jane.smith@example.com'),
    User(name: 'Alice Johnson', email: 'alice.johnson@example.com'),
    User(name: 'Bob Brown', email: 'bob.brown@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        actions: [
          Padding(padding: EdgeInsets.only(right: 10.0), child: LogoutButton())
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserTile(user: users[index]);
        },
      ),
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

class UserTile extends StatelessWidget {
  final User user;

  UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
