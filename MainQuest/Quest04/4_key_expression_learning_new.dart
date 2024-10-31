import 'package:flutter/material.dart';

class KeyExpressionScreen extends StatelessWidget {
  final List<Map<String, String>> keyExpressions = [
    {"expression": "I’m not going to lie,", "meaning": "솔직히 말해서"},
    {"expression": "In all honesty,", "meaning": "솔직히"},
    {"expression": "In my view,", "meaning": "제 생각에는"},
    {"expression": "If you ask me,", "meaning": "제 의견으로는"},
    {"expression": "As far as I can tell,", "meaning": "제가 아는 한"},
    {"expression": "To my mind,", "meaning": "제 생각에는"},
    {"expression": "As far as I'm concerned,", "meaning": "제 입장에서는"},
    {"expression": "The way I see things (it),", "meaning": "제가 보기에는"},
    {"expression": "As I see things (it),", "meaning": "제가 보기에는"},
    {"expression": "It seems to me that", "meaning": "저는 ~ 한 거 같습니다"},
    {"expression": "I believe", "meaning": "저는 ~라고 생각합니다"},
    {"expression": "I’d say that", "meaning": "제 생각에는"},
    {"expression": "I consider it to be", "meaning": "저는 그게 ~라고 여깁니다"},
    {"expression": "To me,", "meaning": "저에게는"},
    {"expression": "From my point of view,", "meaning": "제 관점에서는"},
    {"expression": "It is my view (belief) that", "meaning": "제 견해는"},
    {"expression": "I reckon", "meaning": "제 생각에는"},
    {"expression": "I honestly believe that", "meaning": "진심으로 ~라고 생각합니다"},
    {"expression": "Honestly speaking,", "meaning": "솔직히 말해서"},
    {"expression": "I feel that", "meaning": "저는 ~인 것 같습니다"},
    {"expression": "Personally speaking,", "meaning": "개인적으로"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Key Expressions')),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: keyExpressions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    keyExpressions[index]["expression"]!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    keyExpressions[index]["meaning"]!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vpn_key),
            label: 'Key Expression',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}
