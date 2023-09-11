import 'package:flutter/material.dart';
//package(접두사) : english_words(패키지이름)/ english_words.dart(패캐지 내 다트 파일) < 모든 다트 파일은 lib폴더 내 파일
import 'package:english_words/english_words.dart';

//톱 레벨
int no = 10; //변수 선언

void sayHello(){ //함수 선언
  print('hello, $no'); 
}

class User{ //클래스 선언
  int no = 10;

  void sayHello(){
    print('world, &no');
  }

}


void main(){
  runApp(MyApp());
  print("Hello dart!!");
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final wordpair = WordPair.random();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Text('${wordpair.first}'), //랜덤 word
        ),
      ),
    );
  }
}