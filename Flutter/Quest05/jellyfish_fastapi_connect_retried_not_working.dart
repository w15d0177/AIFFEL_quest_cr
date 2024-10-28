import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const JellyfishClassifierApp());
}

class JellyfishClassifierApp extends StatelessWidget {
  const JellyfishClassifierApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JellyfishClassifierPage(),
    );
  }
}

class JellyfishClassifierPage extends StatefulWidget {
  const JellyfishClassifierPage({Key? key}) : super(key: key);

  @override
  JellyfishClassifierPageState createState() => JellyfishClassifierPageState();
}

class JellyfishClassifierPageState extends State<JellyfishClassifierPage> {
  String predictionResult = "Unknown";
  double predictionProbability = 0.0;

  // FastAPI 서버 URL 설정
  final String apiUrl = "http://localhost:8080";

  // 예측 결과 가져오기 (DEBUG 콘솔 출력용)
  Future<void> fetchPrediction() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/classify'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          predictionResult = data['class'] ?? "Unknown";
        });
        debugPrint("Prediction Result: $predictionResult");
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }

  // 예측 확률 가져오기 (DEBUG 콘솔 출력용)
  Future<void> fetchPredictionProbability() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/probability'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          predictionProbability = data['probability'] ?? 0.0;
        });
        debugPrint(
            "Prediction Probability: ${(predictionProbability * 100).toStringAsFixed(2)}%");
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jellyfish Classifier"),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage('images/jellyfish_icon.jpg'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 업로드한 이미지 표시
            Container(
              width: 300,
              height: 300,
              child: const Image(
                image: AssetImage('images/jellyfish.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20), // 여백 추가를 위한 SizedBox
            // 버튼 두 개 (DEBUG 콘솔에 결과 출력)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: fetchPrediction,
                  child: const Text("Predict Class"),
                ),
                ElevatedButton(
                  onPressed: fetchPredictionProbability,
                  child: const Text("Show Probability"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
