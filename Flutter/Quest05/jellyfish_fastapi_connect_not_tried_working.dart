import 'package:flutter/material.dart';

void main() {
  runApp(JellyfishClassifierApp());
}

class JellyfishClassifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JellyfishClassifierPage(),
    );
  }
}

class JellyfishClassifierPage extends StatefulWidget {
  @override
  _JellyfishClassifierPageState createState() =>
      _JellyfishClassifierPageState();
}

class _JellyfishClassifierPageState extends State<JellyfishClassifierPage> {
  // 예측 클래스 및 확률을 임시로 지정
  String predictionResult = "Unknown";
  double predictionProbability = 0.0;

  // 해파리 예측 로직 (모델 연결 부분을 추가할 수 있음)
  void performPrediction() {
    setState(() {
      predictionResult = "Jellyfish"; // 임시 결과
    });
    print("Prediction Result: $predictionResult"); // DEBUG Console에 출력
  }

  // 예측 확률 로직 (모델 연결 부분을 추가할 수 있음)
  void showPredictionProbability() {
    setState(() {
      predictionProbability = 0.85; // 임시 확률
    });
    print(
        "Prediction Probability: ${(predictionProbability * 100).toStringAsFixed(2)}%"); // DEBUG Console에 출력
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jellyfish Classifier"),
        centerTitle: true,
        leading: Image.asset('assets/jellyfish_icon.jpg'), // 앱바 좌측 해파리 아이콘
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 업로드한 이미지 표시
            Container(
              width: 300,
              height: 300,
              child: Image.asset('assets/jellyfish.jpg', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            // 버튼 두 개 (좌측: 예측 결과 / 우측: 예측 확률)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: performPrediction,
                  child: Text("Predict Class"),
                ),
                ElevatedButton(
                  onPressed: showPredictionProbability,
                  child: Text("Show Probability"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
