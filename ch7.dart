//ch.7 상속과 추상클래스
//ch.7-1 상속 > 다중 상속 불가능
// class SuperClass {
//   int data = 10;
//   void myFun() {
//     print('Super..myFun()...');
//   }
// }

// class SubClass extends SuperClass {
//   int data = 20;
//   void myFun() {
//     print('Sub..myFun()...');
//     super.myFun();
//     print('Sub..myFun()..data: $data, Super..myFun()..data: ${super.data}');
//   }
// }
// main(List<String> args) {
//   //var obj = SubClass();
//   SubClass obj = SubClass();

//   //자식클래스에서 재정의한(오버라이딩한) 멤버에 접근함.
//   obj.myFun();
//   print('obj.data : ${obj.data}');
// }

//부모 생성자 호출하기 >> 자식생성자 호출시 꼭 부모 클래스 생성자도 함께 호출 해야함: super()사용, 기본 부모 생성자 호출
// class SuperClass1 {
//   SuperClass1() {}
// }

// class SubClass1 extends SuperClass1 {
//   SubClass1() : super() {}
// }

// //예외
// class SuperClass {
//   SuperClass(int arg) {} //매개변수 있는 생성자
//   SuperClass.first() {} //명명된 생성자
// }

// class SubClass extends SuperClass {
//   SubClass() : super(30) {}
//   SubClass.first() : super.first() {}
// }

//p.139 부모 클래스의 멤버 변수 초기화
// class SuperClass {
//   late String name;
//   late int age;
//   //SuperClass(this.name, this.age){}이런 식으로 간략화하면 위에 객체 변수에 late 안 써도 됨
//   SuperClass(String name, int age) {
//     this.name = name;
//     this.age = age;
//   }
// }

// class SubClass extends SuperClass {
// 자식 클래스 멤버로 부모 클래스 멤버도 초기화
//   SubClass(String name, int age) : super(name, age) {}
// }

// main() {
//   var obj = new SubClass('KKang', 10);
//   print('${obj.name}, ${obj.age}');
// }

//간략화.ver
// class SuperClass {
//   String name;
//   int age;
//   SuperClass(this.name, this.age) {}
// }

// class SubClass extends SuperClass {
//   SubClass(super.name, super.age);
// }

// main() {
//   var obj = new SubClass('kkang', 10);
//   print('${obj.name}, ${obj.age}');
// }

//ch.7-2 추상 클래스와 인터페이스
//abstract가 없으면 실행문이 작성되는 본문이 없는 추상함수만으로 클래스를 구성할 수 없음 >> 추상 클래스
//추상클래스 : 객체 생성 불가능, 함수를 재정의해서 사용하라는 강제 수단
// abstract class User {
//   int no;
//   String name;

//   User(this.no, this.name);
//   void some();
// }

// class Customer extends User {
//   @override
//   void some() {}
// }

// //인터페이스 > 다중 인터페이스 가능, interface는 지원x
// class MyClass implements User {
//   //오류> 임시적 인터페이스 User의 모든 멤버를 무조건 재정의해야함!!!4
//   int no = 10;
//   String name = 'kkang';

//   @override
//   void some() {
//     print('hello');
//   }
// }

// main() {
//   //구현 클래스를 인터페이스 타입으로 선언 가능
//   User user = MyClass();
// }

//ch.7-3 멤버를 공유하는 믹스인
//믹스인 > 클래스가 아니라서 생성자를 선언할수도 객체를 생성할 수도 없음
// mixin MyMixin {
//   int data1 = 10;
//   static int data2 = 20;

//   //믹스인은 클래스가 아니라서 생성자 선언 불가능
//   //MyMixin() {}

//   void myFun1() {
//     print('MyMixin..myFub()...');
//   }

//   static void myFun2() {}
// }

// class SuperClass {
//   int superData = 20;
//   void superFun() {
//     print('MySuper...superFun()');
//   }
// }

// //다중 상속이 안되는 상속의 한계를 Mixin과 with을 통해 극복
// class MyClass extends SuperClass with MyMixin {
//   void sayHello() {
//     print('class data: $superData, mixin data: $data1');
//     myFun1();
//     superFun();
//   }
// }

// main() {
//   //믹스인은 클래스가 아니라서 객체 생성도 불가능
//   //var obj = new MyMixin();

//   var obj = new MyClass();
//   obj.sayHello();
// }

//믹스인 사용 제약 : on
mixin MyMixin on MySuper {}

class MySuper {}

class MyClass extends MySuper with MyMixin {}

//오류 > 믹스인을 선언할 때 on을 통해 MySuper클래스로 타입을 지정했기에
// class MySome with MyMixin {}

class SomeClass {
  int someData = 10;

  //오류 : 생성자가 있는 클래스에 with을 이용하면 오류 발생
  //SomeClass(){}
}

class MyClass1 with SomeClass {
  void sayHello() {
    print('someData : $someData');
  }
}
