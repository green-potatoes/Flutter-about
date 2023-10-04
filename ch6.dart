//ch.6클래스와 생성자
//ch.6-1 클래스와 객체
// class User {
//   String name = 'kkang';
//   int age = 10;

//   void sayHello() {
//     print('Hello $name, age: $age');
//   }
// }

// //p.122
// class Myclass {
//   String data1 = 'hello';
//   static String data2 = 'hello';

//   myFun1() {
//     print('myFun1 call ....');
//   }

//   static myFun2() {
//     print('myFun2 call....');
//   }
// }

// void main(List<String> args) {
//   // 생성자 선언에서 new는 생략가능 >> User user1 = new User();
//   User user1 = new User();
//   user1.sayHello();
//   user1.name = 'kim';
//   user1.age = 20;
//   user1.sayHello();

//   //Myclass.data1 = 'world'; >> 오류: 객체 생성전에 객체 멤버를 이용할 수 없기에
//   Myclass.data2 = 'world'; // 클래스 멤버(정적 멤버)는 객체 생성전에도 이용가능

//   Myclass obj = new Myclass(); //객체 생성
//   obj.data1 = 'world';
//   //obj.data2 = 'world'; >> 오류: 클래스 멤버(정적 멤버)는 객체로 접근 불가능
// }

//ch.6-2 생성자와 멤버 초기화, 생성자: 객체를 생성할 때 호출되는 함수
// class User {
//   late String name;
//   late int age;
//   //User(this.name, this.age); 이렇게 간략화할 수도 있음
//   User(String name, int age) {
//     this.name = name;
//     this.age = age;
//   }
//   sayHello() {
//     print('name: $name, age: $age');
//   }
// }

// //p.125 초기화 목록 User(List<int> args) : this.name = args[0], this.age = args[1] {}
// class MyClass {
//   late int data1;
//   late int data2;

//   MyClass(List<int> args)
//       : this.data1 = args[0],
//         this.data2 = args[1] {}

//   MyClass.first(int arg1, int arg2)
//       : this.data1 = calFun(arg1),
//         this.data2 = calFun(arg2) {}

//   //초기화 목록 실행 시점이 객체 생성보다 앞서기에 객체 생성 전에도 사용가능하기 위해 static을 붙여 정적 멤버(클래스 멤버)로 함수 선언
//   static int calFun(int arg) {
//     return arg * 10;
//   }

//   printData() {
//     print('$data1, $data2');
//   }
// }

//ch.6-3 명명된 생성자
// class MyClass {
//   MyClass(int data1, int data2) {
//     print('MyClass() call...');
//   }
//   MyClass.first(int arg) : this(arg, 0); //this()구문 : 기본 생성자인 MyClass 호출
//   MyClass.second() : this.first(0); //this.first()구문 : 명명된 생성자인 MyClass.first 호출
// }

//ch.6-4 팩토리 생성자
// class MyClass {
//   MyClass._instance();
//   factory MyClass() {
//     return MyClass._instance();
//   }
// }

// main() {
//   var obj = MyClass();
// }

//캐시 알고리즘 ★★★★★★★★★★★★이해못함!!
// class Image {
//   late String url;
//   static Map<String, Image> _cache = <String, Image>{};
//   Image._instance(this.url);
//   factory Image(String url) {
//     if (_cache[url] == null) {
//       var obj = Image._instance(url);
//       _cache[url] = obj;
//     }
//     return _cache[url]!;
//   }
// }

// main() {
//   var image1 = Image('a.jpg');
//   var image2 = Image('a.jpg');
//   print('image1 == image2 : ${image1 == image2}');
// }

//ch.6-5 상수 생성자
class MyClass {
  //final : 한 번 값을 대입하면 변경할 수 없고 실행중에 값이 결정됨
  final int data1;
  //const : 한 번 값을 대입하면 변경할 수 없고 컴파일 시 값이 결정됨
  //const 생성자 사용 클래스의 모든 변수는 final로 선언해야하기에 초깃값을 사용하도록 강제성 부여
  const MyClass(this.data1);
}

main() {
  var obj1 = MyClass(10);
  var obj2 = MyClass(20);
  //객체 생성 시 const필요하면 const를 추가한 상수 생성자 생성해야함
  var obj3 = const MyClass(10);

  print('obj1.data = ${obj1.data1}, obj2.data = ${obj2.data1}');
}

//서로 같은 개체인 경우
//const를 붙여 상수객체로 선언하고 초깃값이 같으면 똑같은 객체 재사용
var obj1 = const MyClass(10);
var obj2 = const MyClass(10);
