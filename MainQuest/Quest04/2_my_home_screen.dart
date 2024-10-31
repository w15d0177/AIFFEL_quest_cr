import 'package:flutter/material.dart';

// import 구문: 각 화면이 정의된 파일을 임포트합니다.
import 'whole_story_learning.dart';
import 'key_expression_learning_new.dart';
import 'AI_based_quiz.dart';
import 'chat_with_AI.dart';
import 'favorites.dart';
import 'profile.dart';

// 홈 화면
class MyHomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Story', 'screen': WholeStoryScreen()},
    {'title': 'Key Expression', 'screen': KeyExpressionScreen()},
    {'title': 'Quiz', 'screen': QuizScreen()},
    {'title': 'Chat with AI', 'screen': ChatScreen()},
    {'title': 'Favorites', 'screen': FavoritesScreen()},
    {'title': 'Profile', 'screen': ProfileScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2열로 설정하여 3줄로 표현
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: _menuItems.length,
          itemBuilder: (context, index) {
            final item = _menuItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['screen']),
                );
              },
              child: Card(
                color: Colors.yellow[100],
                child: Center(
                  child: Text(
                    item['title'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
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

// WholeStoryScreen 화면
class WholeStoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(child: Text("Whole Story Screen")),
    );
  }
}

// KeyExpressionScreen 화면
class KeyExpressionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Expressions'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(child: Text("Key Expression Screens")),
    );
  }
}

// QuizScreen 화면
class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(child: Text("Quiz Screen")),
    );
  }
}

// ChatScreen 화면
class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with AI'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(child: Text("Chat with AI Screen")),
    );
  }
}

// FavoritesScreen 화면
class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(child: Text("Favorites Screen")),
    );
  }
}

// ProfileScreen 화면
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(child: Text("Profile Screen")),
    );
  }
}
