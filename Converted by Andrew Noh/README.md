# SwiftBasics
Swift basic tutorial notes
온라인 강좌 수강하며 개인적으로 적은 노트 레포지토리입니다.

##Original repo: [https://github.com/andrew-noh/SwiftBasics](https://github.com/andrew-noh/SwiftBasics)


## 1) Var  &  Let

var  //변수, mutable

let  //상수, immutable/unchangable

if let  //옵셔널 바인딩은 옵셔널의 값이 존재하는지를 검사한 뒤, 존재한다면 그 값을 다른 변수에 대입시켜줌. 

if let 또는 if var를 사용. 옵셔널의 값을 벗겨서 값이 있다면 if문 안으로 들어가고, 값이 nil이라면 그냥 통과하게 됨.

guard let  //if let과 유사하나 if문을 통하지 않고 else로 예외처리만 함


## 2) Data types

:String  //String type text
//"\()" 괄호 안에 val/let 넣어서 string 사이에 입력 가능
//.hasPrefix   .hasSuffix method 로 T/F value return 가능

:Double  //기본 64-bit floating-point number

:Float  //32-bit floating-point number ex. 3.14159

:Int  //Integer(정수)

:UInt  //양의 정수(0 ~ 255)

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

.max method  //maximum value
.min method  //minimum value

## 3) Tuple

Tuple  //코마로 구분된 값의 리스트

let tupleExample:(a:INT, b:Int, c:Int) = (1, 2, 3)

(a:INT, b:Int, c:Int) // Typealias

	typealias Time = (h:Int, m:Int, s:Int)
	typealias Duration = (start:Time, end:Time)
	
	let today:Duration = ((9, 10, 23), (17, 8, 21))
	print(\(today.start.h))

Tuple : Int, String, Double이 섞여서 들어갈 수 있다. 순서는 정해져있지 않음

Array : 순서가 정해져있다. 동일한 타입의 인스턴스만 들어갈 수 있다.

## 4) Array

Array<Type> 또는 [Type]
Array의 let과 var
Array 안에는 동일한 타입의 인스턴스가 들어가야 함

	var arrayExample:Array<String> = ["A", "B", "C"]
	var groups:[Int] = [1, 2, 3]

정의하는 법:

	var example:[Int] = [10, 9, 2]
	
	var example:Array<Int> = [9, 8, 7]

+= [item]으로 append 가능

## 5) Dictionary

*값에 이름표를 붙여 저장하는 상자*

var roomCapacity:[String: Int] = ["Bansky":4, "Rivera":8]

roomCapacity["Renoir"] = 40 //값 추가하기

roomCapacity["Kahlo"]  //name에 대한 key값 불러오기

	let roomNames = [String](roomCapacity.keys) //arrys with names 새로운 어레이
	let roomNames = roomCapacity.keys //새로운 튜플
	let capacities = [Int](roomCapacity.values) //keys

let total = capacities.reduce(0, combine: +)

## 6) Set

순서를 가지고 있지 않은 컬렉션

	let subway2 :Set = ["a", "b"]
	let subway3 :Set = ["b", "c"]
	
	let transfer = subway2.intersect(subway3)

## 7) IF
조건문

	if [condition] {
	
	...
	
	}
	
	else {
	
	...
	
	}

example:

	if transfer.count > 0 {
	
	print()
	
	}
	
	else {
	
	print()
	
	}

## 8) FOR

	for i = 0; i < count ; i++ {
	
	...
	
	}
	
	for item in collection {
	
	...
	
	}

## SWITCH

하나의 값에 대한 다양한 실행 매칭
default 값이 필요

	switch [value] {
	
	  case a:
	  
	  ...
	  
	  case b:
	  
	  ...
	  
	  default:
	  
	  ...
	  
	}
	
## WHERE
새로운 변수의 정의

	case ("beer", let amount) where amount > 100 :
	
## OPTIONAL

값이 없는 상태 (타입 + ?)

nil : 값이 없음을 나타냄, 모든 타입의 정수가 nil이 될 수 있음, 0 과 다름

실행중에 nil이 될 수 있는 변수에 '?' 를 붙여 특별관리하는 방법 (optional)

	var title:String = nil // 에러가 남
	var title:String? = nil //에러 나지 않음
	
	var ratings : [Int]? = nil
	var supportURL : String? = nil

## OPTIONAL 접근법

Force Unwrapping: !

값의 존재를 확신할 때 사용
	
	if ratings != nil {
		bookDescription += "has \(ratings!.count) ratings"
	}
	
## OPTIONAL BINDING

Optional Binding

if let, if var : Optional이 아닌 새로운 상수와 변수 생성

Implicitly Unwrapped Optional

선언시 ! 사용 : 구조적으로 초기화 이후 항상 값이 존재하는 경우를 위한 장치

처음에는 nil값을 가지지만 (그래서 optional 사용), 분명히 값을 가질 경우 선언 시 !를 추가하여 선언

var supportURL : String! = nil

bookDescription += "\r\nsupport web page : \(supportURL)" //supportURL에 optional을 사용할 필요 없음


## OPTIONAL BINDING EXERCISE 1

	struct WatchDevice {
	    var pairediPhone:String? //애플와치와 쌍을 이루는 아이폰의 이름.
	    var appInstalled = false //어플리케이션의 설치 유무
	
	    enum WatchSize {
	        case m42, m38
	    }
	}
	
	var appleWatch:WatchDevice? = nil
	appleWatch = WatchDevice(pairediPhone: "링고스타의 아이폰", appInstalled: true)
	
	// ①appleWatch에 대해 optional binding으로 watch라는 새로운 변수를 생성해주세요.
	if let watch = appleWatch {
	    // ②watch와 쌍을 이루는 아이폰의 이름에 대해 
	    // optional binding으로 phoneName이라는 새로운 변수를 생성해 주세요.
	    if let phoneName = appleWatch?.pairediPhone {
	        print ("AppleWatch가 \(phoneName)과 쌍을 이룹니다.")
	    }
	}

## OPTIONAL BINDING EXERCISE 2
	
	struct WatchDevice {
    var pairediPhone:String? //애플와치와 쌍을 이루는 아이폰의 이름.
    var appInstalled = false //어플리케이션의 설치 유무

    enum WatchSize {
        case m42, m38
      }
	}
	
	var appleWatch:WatchDevice! = nil
	appleWatch = WatchDevice(pairediPhone: "링고스타의 아이폰", appInstalled: true)
	
	// appleWatch에 appleWatch에 대해 optional binding으로 phoneName이라는 새로운 변수를 생성해 주세요
	if let phoneName = appleWatch?.pairediPhone {
	    print ("AppleWatch가 \(phoneName)과 쌍을 이룹니다.")
	}
		
	
## FUNCTION

**func**

func functionName (parameter : Type) -> returnType {

...

}

	func myFunction () -> Output {
	
	...
	
	return 
	
	}
	
## 구조체

	struct Task {	
	
		var title:String
		
		var time:Int?
		
	 }
	 
새로운 구조체 생성시 값이 새로 복사된다. 기존의 구조체의 값을 변경할 경우 기존 구조체를 포함하는 구조체의 해당 값은 변하지 않는다.
	 
### Example

	struct Car {
	    let name:String
	    var distance:Double
	}
	
	// tryCar의 모델명은 "트라이카"이고, 총 주행 거리는 29.9km입니다.
	var tryCar:Car = "트라이카"
	var distance = "29.9"
	
	print("tryCar의 모델 명은 \(tryCar.name)이고, 총 주행 거리는 \(tryCar.distance)입니다.")


## CLASS

오브젝트를 생성, 참조로 동작, Swift에서는 Instance 로 자주 사용

	class Employee {
	
	var name:String?
	var phoneNumber:String?
	var boss:Employee?
	
	}

참조하기 때문에 내부 데이터를 변경할 시 전부 변경됨, 서로 연결됨

## ENUM

연관성 있는 값들의 그룹을 만들어 Type-Safe 하게 사용 

일련의 값을 주지 않아도 됨(raw value)

enum = 1st Class type : 어디에나 사용될 수 있는 자격

	struct Task {
	    var title:String?
	    var time:Int?
	    var owner:Employee
	    var participant:Employee?
    
	    var type:TaskType
	    
	    enum TaskType {
	        case Call
	        case Report
	        case Meet
	        case Support
	        
	        var typeTitle:String {
	            get {
	                let titleString:String
	                switch self {
	                case .Call:
	                    titleString = "Call"
	                case .Report:
                    	titleString = "Report"
	                case .Meet:
	                    titleString = "Meet"
	                case .Support:
	                    titleString = "Support"
	                }
	            }
	        }
	    }
	}
	
Call Method: type:Task.TaskType.Report

### 인스턴스 초기화
모든 stored property의 최초값 설정

Stored Property : 메모리를 차지하는 프라퍼티

Computed Property : 계산에 의해 값을 제공하는 프라퍼티

	init (name:String, phone:String) {
		self.init(name:name)
		self.phoneNumber = phone
	}
	
	
	init (a:String, b:Tasks) {
	
	self.a = 
	self.b = 
	
	}
	

## METHOD

타입에 종속되어있는 함수
인스턴스에서 필요한 작업이나 기능을 함수로 만들어놓은 것
Class, Structure, Enumeration 모두 인스턴스 메소드를 가질 수 있음

## UI Table view

UITableViewCell (Background view, Selected background view, Content view(Editing Control, Acessory View, Reordering control)) <= UIView

## Function Type

함수가 1등 시민

String, Double, Int - 기본 타입

Array, Dictionary, Set - 컬렉션 타입들

UIView, UILabel, UITableView - Cocoa Touch 클래스 타입들

	() -> Void
	(Int, Int) -> Int - 함수 타입들  /매개변수와 리턴값

Code from The Swift Programming Language

	func addTwoInts(a:Int, b:Int) -> Int
	{return a + b}
	func multiplyTwoInts(a:Int, b:Int) -> Int
	{return a * b}

	var mathFunction: (Int, Int) -> Int = addTwoInts
	mathFunction(2, 3)   //=5
	mathFunction = multiplyTwoInts
	mathFunction(2, 3)  //=6

func 함수가 매개변수로도 들어갈 수 있다!

	func finalPrice(source:Double, additional:(Double) -> Double) -> Double { }
	
## Closure

1등 시민으로 사용가능한 독립적인 코드 조각 

	{ (params) -> returnType in
	statements
	}

in 이 나오면 클로져

	let addVATClosure = { (source:Double) -> Double in 
	 return source * 1.1
	 }

	 let priceX = addVATClosure(value)

클로저의 축약

	Lev1. let addVATClosure = { (source:Double) -> Double in
	 return source * 1.1
	 }

	 Lev2. let addVATClosure2 = { source in
	  return source * 1.1
	  }

	  Lev3. let addVATClosure3 = { source in
	   source * 1.1
	   }

	   Lev.4 let addVATClosure4 = {$0 * 1.1}

- 매개변수 타입과 리턴타입은 추론 가능하므로 축약 가능
- 리턴이라는 지시어도 당연히므로 축약 가능
- 매개변수의 이름은 내부적으로 사용하는 것이므로 축약하고 위치로 참조 가능하므로 축약한다

## Curring

함수를 리턴하는 함수

func makeAdder (x:Int) -> (Int) -> Int {
 func adder(a:Int) -> Int {
  return x + a
  }
  return adder
 }
 
 let add5 = makeAdder(5)
 
 함수내부의 변수를 조정할 수 있는 함수
 
## Map
 
 배열의 항목에 함수를 적용하기
 
 \[a, b, c, d, e\].map{f(x)}  => \[f(a), f(b), f(c), f(d), f(e)\]

	 let vatMapPrices = transactions_array.map({ transaction -> Double in
	  return transaction * 1.1
	  })
	  
## Filter

조건문을 대체 가능

\[a, b, c, d, e\].filter{x>100} => 100보다 큰 항목들로 이루어진 배열 리턴

## Sort

배열을 정렬

\[a, b, c, d, e\].sort{$0 > $1}

	func ascendantSort (sort1:Double, sort2:Double) -> Bool {
	 return sort1 > sort2
	}

	let sortedPrices = vatPrices.sort(accendantSort)
	let sortedPrices2 = vatPrices.sort({ $0 > $1 })
	let sortedPrices3 = vatPrices.sort(>)

## Reduce

하나의 값으로 수렴

\[a, b, c, d, e\].reduce(초기값, combine:+) => 배열의 모든 값이 합한 값

	func priceSum (base:Double, adder:Double) -> Double {
	 return base + adder
	}

	var sum:Double = 0.0
	for price in vatPrices {
	 sum = priceSum(sum, adder:price)
	}
	
Reduce

	var sum2:Double = 0.0
	let sumReduce = vatPrices.reduce(sum2, combine: priceSum)
	let sumReduce2 - vatPrices.reduce(0.0, combine: { base, adder in
	 base + adder
	 })

	var sumReduce3 = vatPrices.reduce(0.0, combine: +)

문자열도 가능
	let pricesInString = vatPrices.reduce("", combine: { $0 + "\($1)\n"})
	
	
## Class, Method, Function

Class - no round brackets, Function - round brackets, put within a class, 
	class Person {
	
	 init(){
	     print("New person initialized")
	 }
	
	func SayHello(){
	
        print("Hello")
	
    }
	}
	
	var person_1 = Person()

	person_1.SayHello()
	

