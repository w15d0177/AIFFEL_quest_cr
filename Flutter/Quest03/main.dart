import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

// 첫 번째 페이지
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isCat = true; // is_cat 변수 초기화

  void _navigateToSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(isCat: isCat),
      ),
    );
  }

  void _updateIsCat() {
    setState(() {
      isCat = false; // is_cat을 false로 초기화
    });
    _navigateToSecondPage(); // 두 번째 페이지로 이동
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('images_quest/hello_kitty.jpeg'), // 고양이 아이콘 추가
        title: const Text('First Page'), // 중앙 텍스트 추가
        centerTitle: true, // 텍스트를 중앙에 배치
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _updateIsCat,
              child: const Text('Next'), // 버튼 클릭 시 is_cat 업데이트
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // 고양이 이미지를 클릭하면 현재 상태 출력
                debugPrint('Current is_cat state: $isCat');
              },
              child: Image.asset(
                'images_quest/cats_flower.jpeg', // 고양이 이미지 (300x300)
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 두 번째 페이지
class SecondPage extends StatelessWidget {
  final bool isCat;

  const SecondPage({required this.isCat, Key? key}) : super(key: key);

  void _navigateBack(BuildContext context) {
    Navigator.pop(context, true); // 페이지를 pop 하면서 is_cat을 true로 변경
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('images_quest/dog_poodle.jpeg'), // 강아지 아이콘 추가
        title: const Text('Second Page'), // 중앙 텍스트 추가
        centerTitle: true, // 텍스트를 중앙에 배치
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _navigateBack(context), // Back 버튼 클릭 시
              child: const Text('Back'), // 버튼 텍스트
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // 강아지 이미지를 클릭하면 현재 상태 출력
                debugPrint('Current is_cat state: $isCat');
              },
              child: Image.asset(
                'images_quest/dog_grass.jpeg', // 강아지 이미지 (300x300)
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// 이왕이면 예쁜 화면을 만들고 싶은 마음에, 이미지 파일을 선택하는 데도 시간이 많이 걸린 거 같다. 
// 앱바에 텍스트가 중간에 오도록 코드를 다시 수정해야 했다. 
// 이미지가 작게 나와서 다시 캡처해야 했다. 
