import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Facebook logo at the top
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Text(
              'f',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),

          // Account List
          buildAccountItem('Alexandra Kim', null), // No profile picture
          SizedBox(height: 20),
          buildAccountItem('Alex Jihye Kim',
              'images/profile.jpg'), // Profile picture for Alex Jihye Kim

          SizedBox(height: 30),

          // Log into another account button
          ElevatedButton(
            onPressed: () {},
            child: Text('Log into another account'),
          ),
          SizedBox(height: 20),

          // Create new account button
          TextButton(
            onPressed: () {},
            child: Text(
              'Create new account',
              style: TextStyle(color: Colors.blue),
            ),
          ),

          SizedBox(height: 50),

          // Meta logo at the bottom
          Text(
            'Meta',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for each account item with an optional profile image
  Widget buildAccountItem(String name, String? imagePath) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: imagePath != null ? AssetImage(imagePath) : null,
        backgroundColor: imagePath == null ? Colors.grey[300] : null,
        radius: 25,
        child:
            imagePath == null ? Icon(Icons.person, color: Colors.white) : null,
      ),
      title: Text(name, style: TextStyle(fontSize: 18)),
      trailing: Icon(Icons.chevron_right), // Arrow icon on the right
      onTap: () {
        // Action for tapping the account
      },
    );
  }
}
