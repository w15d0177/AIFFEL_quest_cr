import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_home_screen.dart'; // 'my_home_screen.dart'가 'lib' 폴더에 있는지 확인하세요.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI-Based Learning App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: LoginScreen(),
    );
  }
}

// 공통 앱 바 위젯
PreferredSizeWidget customAppBar() {
  return AppBar(
    title: Center(
      child: Text(
        "Do not say 'I think'",
        style: GoogleFonts.caveat(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    backgroundColor: Colors.yellow,
  );
}

// 로그인 페이지
class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: goalController,
              decoration: InputDecoration(labelText: 'Learning Goal'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Sign Up"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomeScreen(
                        //name: nameController.text,
                        //goal: goalController.text,
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 가입 및 프로필 작성 페이지
class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(child: Text("Sign Up Screen")),
    );
  }
}

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
      appBar: customAppBar(),
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
        currentIndex: 6, // Profile 화면에서는 Profile이 선택되도록 설정
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
