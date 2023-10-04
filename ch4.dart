//ch.4-1

/*int? no = 10;


main() {
  bool? data = no?.isEven;
  no = null;

  Object? obj = no;

  String data1 = 'hello';
  String data2 = "world";
  String data3 = '''
  hello
  world
''';

  String data4 = """
  hello
  world
  """;

  String str1 = 'hello';
  String str2 = 'hello';

  print(str1 == str2); //true

  int k = 10;
  String name = 'Baek';

  String myFun() {
    return 'Kim';
  }

  //$은 like c의 %d
  print('no : $k, name: $name, 10+20 : ${10 + 20}, myFun() : ${myFun()}');

  int n1 = 10;
  double d1 = 10.0;

  double d2 = n1.toDouble();
  int n2 = d1.toInt();

  //int n3 = 10;
  n1 = n1.toInt();
  String s1 = '10';

  //String s2 = n3.toString();
  String s2 = n1.toString();
  int n4 = int.parse(s2);
}
*/

//ch4-2

/*
const String data1 = 'hello';

class User {
  static const String data2 = 'hello';

  void some() {
    const String data3 = 'hello';

    //data1 = 'world'; >>>> 오류
  }
}

final int no1;

class MyClass{
  final int no2;
  MyClass(this.no2);

  void some(){
    final no3;
    no3 = 10;
  }
}

main(){
  String s1 = 'hello';
  const String s2 = 'world';
  final String s3 = 'helloworld';

  String s4 = '$s1, $s2';
  const String s5 = '$s2';
}
*/

//ch4-3
//var data1 = 10;
//dynamic data2 = 10;

/* main() {
  var no = 10; //자동으로 no라는 변수(객체)를 int(정수)형으로 인식
  no = 20; //가능
  //no = 'hello'; //불가능

  var no2; //var로 선언 + 초기값 대입 x => dynamic type
  no2 = 10;
  no2 = 'hello';
  no2 = true;

  dynamic data = 10;
  data = 'hello';
  data = true;
  print(data);
*/

//ch.4-4
/* main(){
  List list1 = [
    10,
    'hello',
    true
  ]; //List는 컬렉션 종류 중 하나, 대입 데이터 타입 지정x => dynamic 타입 리스트
  list1[0] = 20;
  list1[1] = 'world';
  print(
      'List : [${list1[0]}, ${list1[1]}, ${list1[2]}]'); //${}: 문자열 탬플릿, 문자열에 동적인 결과를 포함하는 것, {}이것 안에는 실행문의 결과를 포함할 때, ex) 인덱스 값 접근

  List<int> list2 = [10, 20, 30];
  //list2[0] = 'hello'; //오류: int 형으로 지정했기에 char형 대입 불가

  print(list2); //[10, 20, 30]

  list2.add(40);
  list2.add(50);
  print(list2); //[10, 20, 30, 40, 50]

  list2.removeAt(0);
  print(list2); //[20, 30, 40, 50]

  var list3 = List<int>.filled(3, 0); //data 3개, 초기값 0
  print(list3); //[0, 0, 0]

  list3[0] = 10;
  list3[1] = 20;
  list3[2] = 30;
  print(list3); // [10, 20, 30]

  //list3.add(40); //오류 > 제일 첫 줄에서 data개수를 3개로 정해놨기 때문에 더이상 add를 통해 추가할 수 X

  //growable : true >> 처음 지정한 데이터 개수보다 더 많은 데이터 저장 가능!
  var list = List<int>.filled(3, 0, growable: true);
  print(list); //[[0, 0, 0]]

  list[0] = 10;
  list[1] = 20;
  list[2] = 30;
  print(list); //[10, 20, 30]
  list.add(40);
  print(list); //[10, 20, 30, 40]

  var list4 = List<int>.generate(3, (index) => index * 10, growable: true);
  print(list4); //[0, 10, 20]


//컬렉션 타입의 클래스 1. - List<> list = []; - 중복 데이터 허용 / 2. - Set<> set = {}; - 중복 데이터 불허

  Set<int> set1 = {10, 20, 10};
  print(set1); //{10, 20}

  set1.add(30);
  set1.add(40);
  print(set1); //{10, 20, 30, 40}

  Set<int> set2 = Set();
  print(set2); //{} : Set();은 그저 비어있는 집합을 생성
  set2.add(10);
  set2.add(20);
  print(set2); //{10, 20}

  Map<String, String> map1 = {'one': 'hello', 'two': 'world'}; //{'키,KEY':'값,VALUE'}

  print(map1['one']); //'hello'
  map1['one'] = 'world';
  print(map1['one']); //'world'

} */

//ch4-5 널포인트 예외 관리하기
/* int a1 = 10; //널 불허 변수 선언
int? a2 = 10; //널 허용 변수 선언 "?"

testFun() {
  //a1 = null; //널 불허 변수이기에 불가능
  a2 = null; //널 허용 변수이기에 가능
}

// String str1 = null; //오류
String? str2 = null;

class User {}

// User user1 = null; 오류. 모든 타입에 적용, 클래스 User타입에도 적용가능! 다트에서 모든 변수는 클래스임
User? user2 = null;

// int A1; //int A1이 선언 시 class이기에 초기화X, 자동으로 초기값이 모두 null로 선언됨.
//밑에 변수처럼 int?로 선언하면 널 허용 변수가 되면서 굳이 선언과 동시에 초기값 대입할 필요X

int? A2;

//int b1; //오류: int로 선언 시 널 불허 변수인데 초기값을 대입하지 않아 null로 초기화 되었기 때문에 오류 발생!

class User1 {
  //int b1; //오류 : 마찬가지의 이유
}

testFun1() {
  int b1; //함수안에선 b1이 널 불허 변수일지라도 초기값 대입 안해도 됨
  // b1 = null;
  // 그저 함수안에선 톱레벨에서 선언된 변수나, 클래스 내 멤버 변수처럼 선언과 동시에 초기화를 안해도 된다일 뿐, 함수안에서도 널 불허 변수이다! 널 대입 불가!

  //print(b1+10); //그렇다고 값 대입하지 않고 변수 사용 금지!
  b1 = 10;
  print(b1 + 10);
}

main() {
  var a1 = 10;
  var a2 = null; //널 허용변수
  var a3; //dynamic type : 널허용변수 dynamic은 모든 type이 가능한데 해당 범위에 널 허용 변수 type도 포함되어있음
  // var? a4 = null; //var?불가능, var뒤에 ?금지, var는 대입을 통해 컴파일러가 자동 결정~
}

var q1 = 20; //int
var q2 = null; //dynamic
var q3; //dynamic

test2() {
  q1 = 20;
  // q1 = null; //오류 > q1은 널 불허 변수 int형이기 때문에

  q2 = 20;
  q2 = "hello";
  q2 = null;

  q3 = 20;
  q3 = "hello";
  q3 = null;
}

int no1 = 10;
int? no2;

var c1 = no1; //c1변수가 int형으로 선언
var c2 = no2; //c2변수가 int?형으로 선언

testFun3() {
  a1 = 20;
  //a1 = null; //널 불허 변수이기에 오류

  a2 = 20;
  //a2 = "hello"; //int? 형 변수이기에 오류
  a2 = null;
}

dynamic k1 = 10;
dynamic k2;
dynamic? k3; //dynamic 변수는 모든 종류의 타입이 가능하고 이미 거기에 널 허용 타입도 포함되어있기에 ?가 별 의미 없음

testFun4() {
  k1 = null;
  k2 = null;
  k3 = null;
}
 */

/* int a1 = 10;
int? a2 = 20;

//int b1; //오류 : 톱레벨 변수는 선언과 동시에 초기화해주어야하기에 오류
late int b2; //이와 같이 초기화를 해야하는 경우 초기화를 미루는 연산자 'late'

main() {
  //a1 = a2; //오류 >> a1은 nullable a2는 nonull라서 불가

  print("a1 : ${a1 = a2 as int}, a2 : $a2"); //문자열 탬플릿
  a1 = a2 as int; //as : 명시적 형 변환 연산자
  //a2 = a1; //이건 가능
  print("a1 : $a1, a2 : $a2");

  //print('${b2 + 10}'); //오류: b2에 late 연산자가 붙어서 값이 대입X
  b2 = 10;
  print('${b2 + 10}');
}
 */

/* int? a1 = 20;

//반환값 자료형 int?
int? some(arg) {
  if (arg == 10) {
    return 0;
  } else {
    return null;
  }
}

//4-6. 널 안전성 연산자
main() {
  a1!; // ~!: 널인지 아닌지 점검하는 연산자 : 널이 아니라서 실행가능
  a1 = null; //널 대입 후
  //a1!; //실행시 런타임 오류

  int a = some(10)!; //a는 0; 
  print('a : $a');
  int b = some(20)!; //some(20)는 null, some(20)! 실행시 런타임 오류
  print('b : $b');
  /
} */

String? str = "hello"; //널 허용 객체나 리스트의 멤버에 접근하기 위해선 ?.나 ?[] 연산자를 사용해야 함.

main() {
  //str.isEmpty; //오류 : str자체가 String?타입이기에 str멤버에 접근하기 위해서도 str?.을 사용해야함!
  str?.isEmpty;

  int? no1 = 10;
  bool? result1 = no1
      ?.isEven; //만약 no1이 null이면 result1값이 null이 될 수 있기에 널 허용 변수로 사용해야함! 'bool?'
  print('result 1 : $result1'); //true,

  no1 = null;
  bool? result2 = no1?.isEven; //?. 사용
  print('result 2 : $result2'); //null

  List<int>? list = [10, 20, 30];
  print('list[0]: ${list?[0]}'); //10 //?[]사용 ${}: 문자열 탬플릿
  list = null; // list 전체가 null로 초기화
  print('list[0]: ${list?[0]}, list[1]: ${list?[1]}, list[2]: ${list?[2]}');

  int? data3;
  data3 ??= 10; // ??= 연산자 사용
  print('data3 : $data3'); //10
  data3 ??= null; //널이때는 대입 X, 그냥 대입 자체를 안함

  print('data3 : $data3'); //10

  String? data4 = 'hello';
  String? result = data4 ?? 'world';
  print('result : $result'); //hello

  data4 = null;
  result = data4 ?? 'world';
  print('result : $result');
}
