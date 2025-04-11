import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Buddy',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true
      ),
      home: const IntroScreen(),
    );
  }
}

//앱의 가장 기초 화면

class IntroScreen extends StatelessWidget {

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; // 앱 테마 색상 불러오기

    return Scaffold(
      backgroundColor: colorScheme.background, // 배경색 테마 기반으로 설정
      body: SafeArea( // 노치, 상태바 등 피해서 안전하게 UI 배치
        child: Padding(
          padding: const EdgeInsets.all(35.0), // 바깥 여백 설정
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬

            children: [
              // 앱 이름 + 간단 소개
              Padding(padding: EdgeInsets.only(top : 40),
             child: Text(
                '신용점수 예측하고 대출 받으세요.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
      ),
              const SizedBox(height: 45), // 간격

              // 주요 기능 리스트
              const FeatureItem(
                icon: Icons.search,
                text: '신용점수 예측',
              ),
              const FeatureItem(
                icon: Icons.monetization_on,
                text: '맞춤 대출 상품 추천',
              ),
              const FeatureItem(
                icon: Icons.history,
                text: '신청 현황 확인',
              ),

              const Spacer(), // 나머지 공간을 밀어내서 아래 버튼을 하단에 위치시킴

              // 시작하기 버튼
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // 나중에 페이지 이동 등 기능 붙일 예정
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '시작하기',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureItem({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 28, color: colorScheme.primary),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
