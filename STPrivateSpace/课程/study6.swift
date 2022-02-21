//
//  study6.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2022/2/21.
//

import Foundation
import UIKit


/**
    swift 关键字大全
 
    声明相关的关键字  class struct enum extension deinit func import init let var protocol static subscript typealias
    与语句有关的关键字  break case continue default do else if in for return switch where while fallthrough defer
    与表达式有关的关键字 as dynamicType is new super self Type
    特定上下文中使用的关键字  associactivity didSet get infifx inout left mutating none nonmutating operator override postfix precedence prefix rightset unowned unowned(safe) unowned(unsafe) weak  willSet
 
    以#开头的关键字 #availabel  #colorLiteral #column #else #elseif #endif #file #fileReference #function #if #imageLiteral #line #selector #sourceLocation
 
 
 */

class study6: UIViewController {
    
    
    deinit {
        
    }
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Color_bg_FAFAFA
        setupUI()
        addConstraints()
        eventInit()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - 属性

    
    //MARK: - 懒加载
    
    
}

//MARK: - 事件以及布局
extension study6:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        
    }
    func setupUI() {
        
    }
    func setupData() {
        matreixTest()
        isTest()
        availableTest()
        ColumnTest()
        associiativityTest()
    }
}

//MARK: - 代理
extension study6 {
    
    
}

//class 声明一个类或者类方法
class Person:NSObject {
    class func work() {
        printLog("person is working")
    }
}

//let 声明一个常量，不可修改， 但当let修饰一个常量是一个类时，我们可以修改其属性
//var 修饰一个变量，并且可以修改其值
class iOSer: Person {
    let name : String = "guailing"
    var age : Int = 18
    var height : Float = 170
}


//struct 声明一个结构体
struct Student {
    var name : String
    var age : Int
    
    func introduce () {
        printLog("my name is \(name),\(age)")
    }
}

//enum 声明一个枚举
enum Orintation : Int {
    case East,Souce,West,North
}

//final 可以在class、func、var前修饰，表示不可重写，可以把类或者类中的部分实现保护起来，从而避免子类破坏

class Fruit : NSObject {
    final func price() {}
    
    func info () {
        printLog("Fruit info")
    }
    
}

class Apple : Fruit {
    //报错， 不可重写
//    override func price() {}
    
    override func info() {
        printLog("Apple info")
    }
        
}


//override 表示重写， 可为方法或者属性
//略


//subscript 表示下标， 可以让class，struct，以及enum 使用下标访问内部的值
struct Matrix {
    let rows:Int, columns:Int
    var grid:[Double]
    
    init(rows:Int,columns:Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row:Int, column:Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < rows
    }
    
    subscript(row: Int,column : Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "index out of range")
            return grid[(row * column ) + column]
        }
        
        set {
            assert(indexIsValid(row: row, column: column), "index out of range")
            grid[(row * column) + column] = newValue
        }
    }
    
}

func matreixTest() {
    var matrix = Matrix(rows: 2, columns: 2)
    matrix[0,1] = 1.5
    matrix[1,0] = 3.2
    printLog("matrix == \(matrix)")
}


//static 声明静态变量或者函数，它保证在对应的作用域中只有一份，同时也不需要依赖实例化

//mutating 可修改，在结构体和枚举中可以定义自己的方法，但是默认情况下是不可以修改值类型的属性，用mutating修饰则可以修改

//nonmutating：指明成员的 setter 方法不会修改实例的值，但可能会有其它后果。


//typealias 定义类型别名，

typealias width = Float
typealias height = Float

//lazy 懒加载

//init 初始化

//required 说明析构方法是必须实现的

//extension 扩展，可以做各种事情

//convience 便利构造函数
/**
    1.通常写在extension中
    2.便利init函数前需要加上convenience
    3.需要明确调用self.init()
 */


//deinit 析构函数 资源释放和通知移除

//fallthrough 在swich-case 中执行完当前case，继续执行下面的case

//protocol 协议

//open 修饰的对象表示可以被任何人使用

//public

//internal 内部的访问权限

//private 私有访问权限

//fileprivate 当前swift源文件中可以访问

//defer 用于程序离开当前作用域之前，执行一段代码， 该代码必须先被执行到
func deferTest() {
    
    defer {
        printLog("derfer Test End")
    }
    
    printLog("derfer Test begin")
    
}


//guard 当有一个以上条件不满足要求时，离开当前作用域，同时还提供解包可选类型的功能

func guardTest() {
    
    let name : String? = nil
    guard let _ = name else {
        printLog("guard fail")
        return
    }
    printLog("guard succse")
    
}


//where 要求关联类型必须遵守特定协议
protocol whereTestable {
    var name : String {get set}
}

func whereTest<T>(_ nameEntity:T) -> String where T:whereTestable {
    return "This things name is " + nameEntity.name
}

func whereTestB() {
    for i in 0...3 where i % 2 == 0 {
        printLog(i)
    }
}

//Any 用于表示任意类型的实例 包括函数类型

//catch 捕获错误

//is  类型检查运算符 用于确定实例是否为某个子类类型
class Programmer : Person {}
class Nurse : Person {}

func isTest() {
    let people  = [Programmer(),Nurse()]

    for aPerson in people {
        if aPerson is Person {
            printLog("a is Person")
        }
        
        if aPerson is Programmer {
            printLog("a is programmer")
        }else if aPerson is Nurse {
            printLog("a is nurse")
        }
    }

}


//throws 指明在一个函数、方法、初始化方法中可能抛出error


//throw 显示抛出error
func throwTest() throws {
    throw SomeError.error
}


//rethrows 指明当前函数只有当参数抛出error时，才会抛出error
enum SomeError : Error {
    case error
}

func rethrowsTest(onComplete:() throws -> Void) rethrows {
    do {
        try onComplete()
    }catch {
        throw SomeError.error
    }
}

//#开头的关键字
//#available 基于平台参数，通过if，while，guard语句的条件，在运行时检察API的可用性
func availableTest() {
    if #available(iOS 10.0, *) {
        printLog("iOS 10 APIs are availdable")
    }
}
//#colorLiteral 在playground中使用的字面表达式, 用于创建颜色选择器，选取后复制给变量 let acolor  = #colorLiteral

//#fileReference playground 字面量语法， 文件选择器 let file = #fileReference

//imageLiteral playground 语法 ，图片选择器 let image = #imageLiteral

//#column  获取字面量表示式的起始列数
func ColumnTest() {
    class ColumnClass {
        func printInfo() { printLog("column (\(#column))")}
    }
    let column = ColumnClass()
    column.printInfo()
}

//#if

//#else

//#elseif

//endif

//#file 源文件名称

//#function 返回函数名称

//#line 返回当前行数

//#selector objc selector 表达式



//特定上下文中的关键字

//precedencegroup  定义了一个操作符优先级别。操作符优先级的定义和类型声明有些相似，一个操作符比需 要属于某个特定的优先级。Swift 标准库中已经定义了一些常用的运算优先级组，比如加法 优先级 ( AdditionPrecedence ) 和乘法优先级 ( MultiplicationPrecedence ) 等，你可以在这里找 到完整的列表。如果没有适合你的运算符的优先级组，你就需要像我们在例子中做得这样，自己指定结合律方式和优先级顺序了。


//infix 指明一个用于两个值之间的运算符，如果一个全新的全局运算符被定义infix，还需要指定优先级

//operator：特殊符号，用于检查、修改、组合值。


//associativity 指明同一优先级的运算符，在缺少大括号的情况，按照什么顺序结合，使用 left,right,none 定义了结合律，即如果多个同类的操作符顺序出现的计算顺序。比如常⻅的加法和减法都 是 left ，就是说多个加法同时出现时按照从左往右的顺序计算 (因为加法满足交换律，所 以这个顺序无所谓，但是减法的话计算顺序就很重要了)。


//left 指明运算符的结合性是从左到右。在没有使用大括号时，可以用于正确判断同一优先级运算符的执行顺序

//right 指明运算符的结合性是从右到左的。在没有使用大括号时，可以用于正确判断同一优先级运算符的顺序

//none 是一个没有结合性的运算符。不允许这样的运算符相邻出现

//higherThan 运算的优先级，点积运算是优先于乘法运算的。除了 higherThan ，也支持使用 lowerThan 来指定优先级低于某个其他组。

precedencegroup MatchPrecedence {associativity:right higherThan:DefaultPrecedence}
infix operator ~ : MatchPrecedence


func ~(left:Int,right:Int) ->Int {
    return right-left
}

func associiativityTest() {
    printLog("operator = \(4~8)")
}

//convenience 便利构造器
class ConveniceClass {
    var name : String
    init(_ name : String) {
        self.name = name
    }
    
    convenience init() {
        self.init("No Name")
    }
}

//dynamic 指明编译器不会对类成员或者函数的方法进行内联或者虚拟化，意味着对这个成员的访问是使用OC运行时进行动态派发
class DynamicClass {
    ///隐式指明含有”objc“属性
    ///这对依赖于objc-c 黑魔法的库或者框架非常有用
    ///比如KVO,KVC,Swizzling
    dynamic var name:String?
}


//indirect 指明在枚举类型中，存在成员使用枚举类型的实例作为关联值的情况
indirect enum indirectTest {
    case evntType(String)
    case oneEvent(indirectTest)
    case twoEvent(indirectTest,indirectTest)
}

//optional 指明协议的可选方法

//Type 表示任意类型的类型，包括类类型，结构类型，枚举类型，协议类型
func typeTest() {
    let _:Programmer.Type = Programmer.self
}



//unowned 让循环引用中的实例A，不要强引用实例B，前提条件是实例B的生命周期长于A实例

class unownedPerson
{
    var occupation:Job?
}

//当 Person 实例不存在时，job 也不会存在。job 的生命周期取决于持有它的 Person。
class Job
{
    unowned let employee:unownedPerson

    init(with employee:unownedPerson)
    {
        self.employee = employee
    }
}

//weak 允许循环引用中的实例A 弱引用B，而不是强引用，实例B的生命周期更短，并会被先释放
class weakPerson
{
    var residence:House?
}

class House
{
    weak var occupant:weakPerson?
}

func weakTest() {
    var me:weakPerson? = weakPerson()
    let myHome:House? = House()

    me!.residence = myHome
    myHome!.occupant = me

    me = nil
    myHome!.occupant // myHome 等于 nil
}


