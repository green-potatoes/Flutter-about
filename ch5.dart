//ch.5-1 함수 선언과 호출하기
//p.99
/*
dynamic some1() {
  return 10;
}

some2() {
  return 'ten';
}

some3() {
  //return문 없음 >> 자동으로 null반환
}
//함수본문을 중관호를 이용해서 묽기
void printUser1() {
  print('hello world');
}

//함수본문이 한 줄일 때 화살표 기호를 이용해서 한줄 함수로 선언가능 : 화살표 함수
void printUser2() => print('hello world');

main() {
  print('some1() result : ${some1()}');
  print('some2() result : ${some2()}');
  print('some3() result : ${some3()}');

  printUser1();
  printUser2();
}
*/

//5-2. 명명된 매개변수 - optional
//오류: 명명된 매개변수는 순서상 가장 마지막에 선언해야함
//void some1({String? data2, bool? data3}, int data1){}
//오류: 명명된 매개변수는 함수 하나에 최대 한번만 선언 가능함
//void some2(int data1, {String? data2, bool? data3}, {int? data4}){}

// void some3(int data1, {String? data2, bool? data3}) {}

// //p.104
// //'hello'라는 기본인자 설정
// myFun({String data = 'hello'}) {
//   return data;
// }

// someFun({required int arg1}) {
//   print('someFun()..arg1 : $arg1');
// }

// void main() {
//   //some3(); //오류: 명명된 매개변수로 선언된 매개변수는 함수 호출시 생략가능하지만 일반 매개변수는 생략 불가
//   some3(10);
//   //some3(10, 'hello', true); //오류: 명명된 매개변수는 반드시 이름과 값을 함께 전달해야함
//   some3(10, data2: 'hello', data3: true);
//   some3(10, data3: true, data2: 'hello');
//   some3(data2: 'hello', data3: true, 10);

//   print('myFun() result : ${myFun()}');
//   print('myFun(world) result : ${myFun(data: 'world')}');

//   //someFun(); //오류 > required 예약어로 인해 필수 매개변수 이기에
//   someFun(arg1: 10);
// }

//ch.5-3. 옵셔널 위치 매개변수
// void some(int arg1, [String arg2 = 'hello', bool arg3 = false]) {}

// void main() {
//   //some(); //오류: 데이터전달이 선택인 옵셔널 위치 매개변수와 달리 일반 매개변수는 선언필요
//   some(10);
//   //some(10, arg2: 'world', arg3: true); //오류: 명명된 매개변수와 달리 옵셔널 위치 매개변수는 매개변수 이름 생략
//   some(10, 'world', true);
//   //some(10, true, 'world'); //오류: 옵셔널 위치 매개변수는 위치가 맞아야함
//   some(10, 'world'); // arg3엔 기본인자가 설정되어있기에 기본인자가 대입된다.
//   // some(10, true); //오류: 위치와 타입이 맞지 않기에 오류 발생
//   some(10, 'hello', true);
// }

//ch5-4. 함수 타입 인자
// int plus(int num) {
//   return num + 10;
// }

// int multiply(int num) {
//   return num * 10;
// }

// //testFun함수의 반환값과 매개변수 모두 함수타입Function
// Function testFun(Function argFun) {
//   print('argFun : ${argFun(20)}');
//   return multiply;
// }

// //함수 타입제한
// some(int f(int a)) {
//   f(30);
// }

// //익명 함수
// fun1(arg){
//   return 10;
// }

// Function fun2 = (arg){
//   return;
// };

// main(List<String> args) {
//   var result = testFun(plus);
//   //testFun(plus) -> return multiply
//   print('result : ${result(20)}');

//   some((int a) {
//     return a + 20;
//   });
// }

//ch.5-5 게터함수 & 세터함수
// String _name = 'hello';

// //게터함수 : 데이터를 가져오는 함수
// String get name {
//   return _name.toUpperCase();
// }

// //세터함수 : 데이터를 바꾸는 함수
// set name(value) {
//   _name = value;
// }

// void main(List<String> args) {
//   name = "world";
//   print('name : $name');
// }

//ch.5-6 기타 연산자 알아보기
// class User {
//   void some() {
//     print("User...some()...");
//   }
// }

// class User1 {
//   String? name;
//   int? age;

//   some() {
//     print('name : $name, age : $age');
//   }
// }

// main() {
//   int a = 8;
//   //나누기 연산자, /는 값을 실수형으로, ~/는 값을 정수형으로 반환
//   print('a/5 = ${a / 5}');
//   print('a~/5 = ${a ~/ 5}');

//   Object obj = User();
//   // obj.some();

//   if (obj is User) {
//     obj.some();
//   }

//   Object obj1 = User();
//   //obj1.some();도 오류
//   (obj1 as User).some();

//   // var user = User1();
//   // user.name = 'KKang';
//   // user.age = 10;
//   // user.some();

//   //케스케이드 연산자
//   User1()
//     ..name = 'kkang'
//     ..age = 10
//     ..some();
// }

//ch.5-7 실행 흐름 제어하기

some() {
  throw FormatException('my exception');
}

some1() {
  throw Exception('my exception');
}

void main(List<String> args) {
  try {
    print('step1....');
    some();
    print('step2....');
  } on FormatException catch (e) {
    print('step3....$e');
  } on Exception catch (e) {
    print('step4....$e');
  } finally {
    print('step5....');
  }
  print('step6....');
}
