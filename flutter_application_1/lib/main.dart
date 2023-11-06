import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyListWidget());
  }
}

class MyListWidget extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyListWidgetState();
  }
}

class _MyListWidgetState extends State<MyListWidget> {
  Color color1 = Colors.black;
  Color color2 = Colors.red;
  Color color3 = Colors.blue;
  void onchange() {
    setState(() {
      color1 = getRandomcolor();
      color2 = getRandomcolor();
      color3 = getRandomcolor();
    });
  }

  Color getRandomcolor() {
    return Color(
      (Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(1.0); //0~0xFFFFFF 사이의 랜덤한 정수 값 생성
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Key Test'),
        ),
        body: Column(children: [
          Container(width: double.infinity, height: 200, color: color1),
          Container(width: double.infinity, height: 200, color: color2),
          Container(width: double.infinity, height: 200, color: color3),
          IconButton(
            onPressed: onchange,
            icon: const Icon(Icons.refresh),
          )
        ]));
  }
}
