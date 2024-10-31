import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> keyExpressions = [
    'I\'m not going to lie',
    'In all honesty',
    'In my view',
    'If you ask me',
    'As far as I can tell',
    'To my mind',
    'As far as I\'m concerned',
    'The way I see things (it)',
    'As I see things (it)',
    'It seems to me that',
    'I believe',
    'I\'d say',
    'I consider it to be',
    'To me',
    'From my point of view',
    'It is my view (belief) that',
    'I reckon',
    'I honestly believe that',
    'Honestly speaking',
    'I feel that',
    'Personally speaking',
  ];

  List<Map<String, String>> chatMessages = [];
  String userMessage = "";
  String feedback = "";

  Future<void> sendMessageToAI(String message) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Authorization':
              'Bearer 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',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'prompt': 'Reply to: "$message"',
          'max_tokens': 100,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String aiResponse = data['choices'][0]['text'].trim();

        setState(() {
          chatMessages.add({"user": message, "ai": aiResponse});
          feedback = "AI와의 대화가 성공적으로 이루어졌습니다.";
        });
      } else {
        setState(() {
          feedback = "대화 생성 실패: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        feedback = "API 요청 중 오류 발생: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('AI Chatbot with Key Expressions')),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You: ${chatMessages[index]["user"]}",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "AI: ${chatMessages[index]["ai"]}",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                userMessage = value;
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  sendMessageToAI(value);
                }
              },
              decoration: InputDecoration(
                labelText: "Enter your message",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              feedback,
              style: TextStyle(color: Colors.red, fontSize: 16.0),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Story'),
          BottomNavigationBarItem(
              icon: Icon(Icons.key), label: 'Key Expression'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
