import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Do not say "I think"',
                style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '''
I'm not going to lie, I was pretty insulted to not be invited to my ex boyfriend’s wedding.
In all honesty, I had every right to be there.

In my view, I should’ve been invited so it was totally fair for me to turn up on the day.

If you ask me, the church service was wonderful, but it was a shame I had to stand at the back.

As far as I can tell, the bride wasn’t really expecting me.

To my mind, she should’ve been happier to see me and receive my support.

As far as I’m concerned, she totally overreacted and shouldn’t have cried.

The way I see things (it), I made the family photographs a lot more interesting.

As I see things (it), they obviously didn’t take me into consideration when drawing up the seating plans.

It seems to me that everyone overreacted when I tried to sit at the top table.

I believe that they should have just made space for me in the first place.

I’d say that the food was very good, but it was a shame I had to share with my neighbour.

I consider it to be very rude that I was forced to sit down when I stood up to make a speech.

To me, no one knows my ex better than me so I should’ve been able to tell all of our funny stories.

From my point of view, the first dance was cringe-worthy so I did everyone a favor by joining in.

It is my view (belief) that the open bar made everything worse.

I reckon the sixth gin and tonic tipped me over the edge.

I honestly believe that if I hadn’t started cutting the cake, no one would have.

Honestly speaking, I probably shouldn’t have thrown my slice at the bride.

I feel that my ex could have found a more welcoming bride with a better sense of humor.

Personally speaking, calling the police was a bit OTT.
...
''', // 긴 텍스트 축약
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OTT: over the top, too much",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        type: BottomNavigationBarType.fixed,
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

class KeyExpressionScreen extends StatefulWidget {
  @override
  _KeyExpressionScreenState createState() => _KeyExpressionScreenState();
}

class _KeyExpressionScreenState extends State<KeyExpressionScreen> {
  final List<String> keyExpressions = [
    'I\'m not going to lie',
    'In all honesty',
    // 추가된 표현
  ];

  String generatedQuestion = "";
  String feedback = "";

  Future<void> generateQuestion(String expression) async {
    const apiKey = 'your-api-key'; // 환경변수 또는 안전한 저장소에서 가져오는 것을 권장
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
          'prompt': 'Create a question based on the expression: "$expression"',
          'max_tokens': 50,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          generatedQuestion = data['choices'][0]['text'].trim();
          feedback = "";
        });
      } else {
        setState(() {
          feedback = "질문 생성 실패: ${response.reasonPhrase}";
        });
      }
    } catch (e) {
      setState(() {
        feedback = "API 요청 중 오류 발생: $e";
      });
    }
  }

  void checkAnswer(String answer) {
    if (answer.isNotEmpty) {
      setState(() {
        feedback = "정답입니다! 잘했습니다.";
      });
    } else {
      setState(() {
        feedback = "틀렸습니다. 다시 시도해 주세요.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Key Expressions')),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: keyExpressions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    keyExpressions[index],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => generateQuestion(keyExpressions[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "생성된 질문: $generatedQuestion",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onSubmitted: (value) {
                checkAnswer(value);
              },
              decoration: InputDecoration(
                labelText: "답변을 입력하세요",
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
        backgroundColor: Colors.yellow,
        type: BottomNavigationBarType.fixed,
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
