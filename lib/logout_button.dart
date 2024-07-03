import 'package:flutter/material.dart';
import 'login_screen.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.logout),
      label: Text('Logout', style: TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: 16),
        backgroundColor: Colors.red,
      ),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }
}
