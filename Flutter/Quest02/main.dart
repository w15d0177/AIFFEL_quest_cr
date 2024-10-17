import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // 앱 실행 시 처음 보이는 페이지
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 좌측 상단에 아이콘 추가
        leading: Image.asset('images_quest/add_icon.jpg'),
        title: Text(
          '플러터 앱 만들기',
          style: TextStyle(
            color: Colors.white, // 글자 색상을 흰색으로 설정
            fontWeight: FontWeight.bold, // 글꼴을 볼드체로 설정
          ),
        ),
        centerTitle: true, // 제목을 중앙에 정렬
        backgroundColor: Colors.blue, // AppBar 배경색 설정
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 중앙에 Button 추가
          Center(
            child: ElevatedButton(
              onPressed: () {
                // 버튼 클릭 시 콘솔 출력
                print('버튼이 눌렸습니다.');
              },
              child: Text('Text'), // 버튼에 "Text"라고 표기
            ),
          ),
          SizedBox(height: 50), // 버튼과 컨테이너 사이에 여백 추가
          // 화면 하단 중앙에 중첩된 컨테이너 추가
          Center(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 300,
                  color: Colors.red,
                ),
                Container(
                  width: 240,
                  height: 240,
                  color: Colors.orange,
                ),
                Container(
                  width: 180,
                  height: 180,
                  color: Colors.yellow,
                ),
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.green,
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
