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
          buildAccountItem(
              'Alexandra Kim', null, context), // No profile picture
          SizedBox(height: 20),
          buildAccountItem('Alex Jihye Kim', 'images/profile.jpg',
              context), // Profile picture for Alex Jihye Kim

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
  Widget buildAccountItem(
      String name, String? imagePath, BuildContext context) {
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
        if (name == 'Alex Jihye Kim') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()), // Navigate to HomePage
          );
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of screens to navigate to
  final List<Widget> _screens = [
    HomeScreen(),
    VideoScreen(),
    FriendsScreen(),
    ProfileScreen(),
    NotificationScreen(),
    MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        onTap: _onItemTapped, // Handle item taps
        type: BottomNavigationBarType.fixed, // Keep items fixed
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "facebook",
          style: TextStyle(
              color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.message, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('images/profile.jpg'), // Profile picture
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text("What's on your mind?", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Divider(thickness: 2),
          Container(
            height: MediaQuery.of(context).size.width / 3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildStoryItem('images/profile.jpg', 'Your Story', context),
                buildStoryItem('images/image_1.jpg', 'User 1', context),
                buildStoryItem('images/image_2.jpg', 'User 2', context),
                buildStoryItem('images/image_3.jpg', 'User 3', context),
                buildStoryItem('images/image_4.jpg', 'User 4', context),
              ],
            ),
          ),
          Divider(thickness: 2),
          Expanded(
            child: ListView(
              children: [
                buildFeedItem('User 1', 'images/image_1.jpg',
                    'This is a sample post from User 1'),
                Image.asset('images/feed.jpg'), // Feed image
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStoryItem(
      String imagePath, String userName, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(userName, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget buildFeedItem(String userName, String userImage, String postText) {
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
          Text(postText),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}

class VideoScreen extends StatelessWidget {
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
                buildVideoFeedItem('User 1', 'images/video.jpg'),
                buildVideoFeedItem('User 2', 'images/image_4.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVideoFeedItem(String userName, String videoPath) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Image.asset(videoPath, fit: BoxFit.cover),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}

class FriendsScreen extends StatelessWidget {
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

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Screen')),
      body: Center(child: Text('This is the Notification Screen')),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Screen')),
      body: Center(child: Text('This is the Menu Screen')),
    );
  }
}
