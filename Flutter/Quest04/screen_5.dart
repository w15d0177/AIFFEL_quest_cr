import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Alex Jihye Kim',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Background Image with profile image
          Stack(
            children: [
              Image.asset('images/background.jpg',
                  width: double.infinity, height: 400, fit: BoxFit.cover),
              Positioned(
                bottom: 0,
                left: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/profile.jpg'),
                  radius: 50,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Profile name
          Text(
            'Alex Jihye Kim',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 5),
          // Number of friends
          Text('00 friends'),
          SizedBox(height: 20),
          // Action Buttons: Add to story, Edit profile, More options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Add to story'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Edit profile'),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 20),
          // People you may know
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('People you may know',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: 10),
          // Story Section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildStoryItem('images/image_5.jpg'),
                buildStoryItem('images/image_6.jpg'),
                buildStoryItem('images/image_7.jpg'),
              ],
            ),
          ),
        ],
      ),
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

  // Story item widget
  Widget buildStoryItem(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
