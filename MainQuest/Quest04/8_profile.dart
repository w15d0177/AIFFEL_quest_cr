import 'package:flutter/material.dart';

// 사용자 프로필 페이지
class ProfileScreen extends StatelessWidget {
  final String name;
  final String goal;
  final String level;
  final double progress;
  final String proficiency;

  ProfileScreen({
    required this.name,
    required this.goal,
    required this.level,
    required this.progress,
    required this.proficiency,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, $name!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Learning Goal: $goal"),
            Text("Current Level: $level"),
            SizedBox(height: 20),
            Text(
              "Learning Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.yellow[700],
              minHeight: 8.0,
            ),
            SizedBox(height: 10),
            Text("${(progress * 100).toStringAsFixed(1)}% complete"),
            SizedBox(height: 20),
            Text(
              "Current Proficiency",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              proficiency,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        currentIndex: 6, // 프로필 화면에서는 Profile이 선택되도록 설정
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Story",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vpn_key),
            label: "Key Expression",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
