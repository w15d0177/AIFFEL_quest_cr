import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FriendsPage(),
    );
  }
}

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Friends",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Suggestions and Your Friends section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildRoundedButton("Suggestions"),
                buildRoundedButton("Your friends"),
              ],
            ),
          ),
          SizedBox(height: 10),

          // Friend requests section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Friend requests",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: Text("See all", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
          Divider(thickness: 2),

          // Friend requests list
          Column(
            children: [
              buildFriendRequestItem('null', 'User 1'),
              buildFriendRequestItem('null', 'User 2'),
              buildFriendRequestItem('null', 'User 3'),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text("See all", style: TextStyle(color: Colors.blue)),
          ),
          Divider(thickness: 2),

          // People you may know section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("People you may know",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          buildSuggestedUserItem('null', 'User 4'),
          buildSuggestedUserItem('null', 'User 5'),
          buildSuggestedUserItem('null', 'User 6'),
        ],
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  // Widget for rounded buttons
  Widget buildRoundedButton(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  // Friend request item widget
  Widget buildFriendRequestItem(String userImage, String userName) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userImage),
            radius: 20,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text("Confirm",
                          style: TextStyle(color: Colors.blue))),
                  SizedBox(width: 10),
                  TextButton(
                      onPressed: () {},
                      child:
                          Text("Delete", style: TextStyle(color: Colors.red))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Suggested user item widget
  Widget buildSuggestedUserItem(String userImage, String userName) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userImage),
            radius: 20,
          ),
          SizedBox(width: 10),
          Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
