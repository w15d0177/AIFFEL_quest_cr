import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoPage(),
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Video",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
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
          // Video categories
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("For you", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Live", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Reels", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Following",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(thickness: 2),

          // Video feed section
          Expanded(
            child: ListView(
              children: [
                buildFeedItem('null', 'User 1', 'images/video.jpg'),
                buildFeedItem('null', 'User 2', 'images/image_4.jpg'),
              ],
            ),
          ),
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

  // Video feed item widget with account icon and name
  Widget buildFeedItem(String userImage, String userName, String videoImage) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userImage),
                radius: 20,
              ),
              SizedBox(width: 10),
              Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Image.asset(videoImage), // Video feed image
              Positioned(
                right: 10,
                bottom: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  radius: 15,
                  child: Icon(Icons.volume_up, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}
