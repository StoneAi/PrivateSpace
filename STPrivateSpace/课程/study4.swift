//
//  study4.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2022/2/9.
//

import Foundation
import UIKit

/**
    swift 演进之路
 Swift 1.1

 countElements() 改成了 count()。
 @NSApplicationMain 可以在 macOS 上使用。
 Swift 1.2

 引入 Set 类型。
 if let 可以放到一起，使用逗号分隔。
 新增 zip() 和 flatMap()。
 类增加静态方法和静态属性，使用 static 关键字描述。
 as! 用于类型强转，失败会崩溃。
 @noescape 用于描述作为参数闭包，用来告诉 Swift 闭包将在函数返回前使用。
 常量可以延后初始化。
 Swift 2.0

 增加 guard 关键字，用于解可选项值。
 defer 关键字用来延迟执行，即使抛出错误了都会在最后执行。
 ErrorType 协议，以及 throws、do、try 和 catch 的引入用来处理错误。
 characters 加上 count，用来替代 count()。
 #available 用来检查系统版本。
 Swift 2.1

 字符串插值可以包含字符串字面符号。
 Swift 2.2

 FILE, LINE 和 FUNCTION 换成 #file，#line 和 #function。
 废弃 ++ 和 – 操作符。
 C 语言风格 for 循环废弃。
 废弃变量参数，因为变量参数容易和 inout 搞混。
 废弃字符串化的选择器，选择器不再能写成字符串了。
 元组可直接比较是否相等。
 Swift 3.0

 规范动词和名词来命名。
 去掉 NS 前缀。
 方法名描述参数部分变为参数名。
 省略没必要的单词，命名做了简化呢。比如 stringByTrimmingCharactersInSet 就换成了 trimmingCharacters。
 枚举的属性使用小写开头。
 引入 C 函数的属性。
 Swift 3.1

 序列新增 prefix(while:) 和 drop(while:) 方法，顺序遍历执行闭包里的逻辑判断，满足条件就返回，遇到不匹配就会停止遍历。prefix 返回满足条件的元素集合，drop 返回停止遍历之后那些元素集合。
 泛型适用于嵌套类型。
 类型的扩展可以使用约束条件，比如扩展数组时，加上元素为整数的约束，这样的扩展就只会对元素为整数的数组有效。
 Swift 4.0

 加入 Codable 协议，更 Swifty 的编码和解码。提案 SE-0167 Swift Encoders
 字符串加入三个双引号的支持，让多行字符串编写更加直观。提案 SE-0168 Multi-Line String Literals
 字符串变成集合，表示可以对字符串进行逐字遍历、map 和反转等操作。
 keypaths 语法提升。提案见 SE-0161 Smart KeyPaths: Better Key-Value Coding for Swift
 集合加入 ..<10 这样语法的单边切片。提案 SE-0172 One-sided Ranges
 字典新增 mapValues，可 map 字典的值。通过 grouping 可对字典进行分组生成新字典，键和值都可以。从字典中取值，如果键对应无值，则使用通过 default 指定的默认值。提案 SE-0165 Dictionary & Set Enhancements
 Swift 4.1

 Hashable 也不需要返回一个唯一的 hashValue 哈希值属性。
 Equatable 和 Hashable 自动合成的提案参见 SE-0185 Synthesizing Equatable and Hashable conformance。
 两个自定类型比较是否相等时，不再需要比较每个属性，Swift 会自动生成 == 方法，你只需要声明 Equatable 协议。
 引入 KeyDecodingStrategy属性，其中 .convertFromSnakeCase 可以将下划线的命名转化成驼峰的命名。
 引入条件符合性，只有满足一定条件才符合协议。比如扩展数组要求当里面元素满足某协议数组才符合这个协议。提案见 SE-0143 Conditional conformances。
 引入 canImport 宏条件关键字，判断是否可以使用某库，以前只能通过判断操作系统平台来判断。提案见 SE-0075 Adding a Build Configuration Import Test。
 新增能够去除为零项目的 compactMap()。提案 SE-0187 Introduce Sequence.compactMap(_:)
 关联类型可以创建递归约束，提案见 SE-0157 Support recursive constraints on associated types
 targetEnvironment 环境的判断，比如模拟器。提案见 SE-0190 Target environment platform condition 。
 Swift 4.2

 新增动态成员查询，@dynamicMemberLookup 新属性，指示访问属性时调用一个已实现的处理动态查找的下标方法 subscript(dynamicMemeber:)，通过指定属性字符串名返回值。提案 SE-0195 Introduce User-defined “Dynamic Member Lookup” Types
 集合新加 removeAll(where:) 方法，过滤满足条件所有元素。比 filter 更高效。提案 SE-0197 Adding in-place removeAll(where:) to the Standard Library
 布尔值增加 toggle() 方法，用来切换布尔值。提案见 SE-0199 Adding toggle to Bool
 引入 CaseIterable 协议，可以将枚举中所有 case 生成 allCases 数组。提案 SE-0194 Derived Collection of Enum Cases
 引入 #warning 和 #error 两个新的编译器指令。#warning 会产生一个警告，#error 会直接让编译出错。比如必须要填写 token 才能编译的话可以在设置 token 的代码前加上 #error 和说明。提案见 SE-0196 Compiler Diagnostic Directives
 新增加密安全的随机 API。直接在数字类型上调用 random() 方法生成随机数。shuffle() 方法可以对数组进行乱序重排。提案 SE-0202 Random Unification
 更简单更安全的哈希协议，引入新的 Hasher 结构，通过 combine() 方法为哈希值添加更多属性，调用 finalize() 方法生成最终哈希值。提案 SE-0206 Hashable Enhancements
 集合增加 allSatisfy() 用来判断集合中的元素是否都满足了一个条件。提案 SE-0207 Add an allSatisfy algorithm to Sequence
 Swift 5.0

 @dynamicCallable 动态可调用类型。通过实现 dynamicallyCall 方法来定义变参的处理。提案 SE-0216 Introduce user-defined dynamically “callable” types
 新加 Result 类型用来处理错误。提案 SE-0235 Add Result to the Standard Library
 新增原始字符串能力，在字符串前加上一个或多个#符号。里面的双引号和转义符号将不再起作用了，如果想让转义符起作用，需要在转义符后面加上#符号。提案见 SE-0200 Enhancing String Literals Delimiters to Support Raw Text
 自定义字符串插值。提案 SE-0228 Fix ExpressibleByStringInterpolation
 枚举新增 @unknown 用来区分固定的枚举和可能改变的枚举的能力。用于防止未来新增枚举属性会进行提醒提示完善每个 case 的处理。提案 SE-0192 Handling Future Enum Cases
 compactMapValues() 对字典值进行转换和解包。可以解可选类型，并去掉 nil 值。提案 SE-0218 Introduce compactMapValues to Dictionary
 扁平化 try?。提案 SE-0230 Flatten nested optionals resulting from ‘try?’
 isMultiple(of:) 方法检查一个数字是否是另一个数字的倍数。提案见 SE-0225 Adding isMultiple to BinaryInteger
 Swift 5.1

 有序集合的 diff，通过 difference(from:) 方法，可以返回要删除哪些和添加哪些项目能够让两个集合相等。提案 SE-0240 Ordered Collection Diffing
 属性包装。提案 SE-0258 Property Wrappers
 不透明返回类型。函数调用者决定返回什么类型是泛型，函数自身决定返回什么类型使用不透明返回类型。提案 SE-0244 Opaque Result Types
 初始化有默认值的属性可不设置。提案 SE-0242 Synthesize default values for the memberwise initializer
 单行表达式函数隐式返回，返回一个单行表达式的函数可以不用 return 关键字。提案 SE-0255 Implicit returns from single-expression functions
 在类、结构体和枚举里使用 Self，Self 可以指代包含的类型。提案见 SE-0068 Expanding Swift Self to class members and value types
 静态下标。提案 SE-0254 Static and class subscripts
 枚举里有 none 的 case 编译器会提示换成 Optional.none。
 引入未初始化数组。提案 SE-0245 Add an Array Initializer with Access to Uninitialized Storage
 Swift 5.2

 自定义类型中实现了 callAsFunction() 的话，该类型的值就可以直接调用。提案 SE-0253 Callable values of user-defined nominal types
 键路径表达式作为函数。提案 SE-0249 Key Path Expressions as Functions
 Swift 5.3

 SPM 包管理资源，SPM 可以包含资源文件，比如多媒体或文本等。通过 Bundle.module 访问这些资源。提案 SE-0271 Package Manager Resources
 SPM 包里资源本地化。提案 SE-0278 Package Manager Localized Resources
 SPM 可以整合二进制包依赖。提案 SE-0272 Package Manager Binary Dependencies
 SPM 可以设置特定平台的依赖。提案 SE-0273 Package Manager Conditional Target Dependencies
 单个 catch 块中捕获多个 Error 的 case。提案 SE-0276 Multi-Pattern Catch Clauses
 支持多个尾部闭包。提案见 SE-0279 Multiple Trailing Closures
 符合 Comparable 协议的枚举可以进行比较。提案 SE-0266 Synthesized Comparable conformance for enum types
 很多地方可以不用加 self 来指代实例自己了。提案见 SE-0269 Increase availability of implicit self in @escaping closures when reference cycles are unlikely to occur
 @main 可以方便指定程序入口点。提案 SE-0281 @main: Type-Based Program Entry Points
 where 子句可以用到泛型和扩展函数中。提案 SE-0267 where clauses on contextually generic declarations
 枚举的 case 也可以符合协议。提案 SE-0280 Enum cases as protocol witnesses
 完善 didSet，性能提升。提案 SE-0268 Refine didSet Semantics
 新增 Float16 类型，即半精度浮点类型。提案 SE-0277 Float16
 Swift 5.4

 SPM 支持 @main。提案见 SE-0294 Declaring executable targets in Package Manifests
 结果生成器（Result builders），通过传递序列创建新值，SwiftUI就是使用的结果生成器将多个视图生成一个视图。提案 SE-0289 Result builders
 增强隐式成员语法，即使用了隐式的成员可以进行链式处理。提案见 SE-0287 Extend implicit member syntax to cover chains of member references
 函数开始有了使用多个变量参数的能力。提案 SE-0284 Allow Multiple Variadic Parameters in Functions, Subscripts, and Initializers
 嵌套函数可以重载，嵌套函数可以在声明函数之前调用他。
 属性包装支持局部变量。
 Swift 5.5

 Async await，用同步写法来处理异步。提案 SE-0296 Async/await
 Async sequences，异步序列上的循环能力。符合 AsyncSequence 协议的序列可以通过 for await 来进行异步循环。提案见 SE-0298 Async/Await: Sequences
 结构化的并发，使用 Task 和 TaskGroup 执行、取消和监听当前操作的方法。复杂的并发处理可以使用 withTaskGroup() 来创建一组 Task，addTask() 用来添加任务，cancelAll() 可以取消任务，addTask() 在取消任务后可以继续添加任务，如果使用了 addTaskUnlessCancelled() 方法就可以避免取消后会继续添加任务这种情况。提案见 SE-0304 Structured concurrency
 只读属性支持 async 和 throws 关键字。提案 SE-0310 Effectful Read-only Properties
 async let，可以创建 await 子任务。提案 SE-0317 async let bindings
 以前异步代码的适配。比如 DispatchQueue.main.async，外部库可以通过 withCheckedContinuation() 函数来对以前异步代码进行封装。 提案见 SE-0300 Continuations for interfacing async tasks with synchronous code
 Actor，可以确保内部只能被一个线程访问，避免存储属性和方法出现竞争条件。提案在这 SE-0306 Actors
 全局 actors，通过 actor 将全局状态隔离出来，避免数据竞争。比如主线程 @MainActor 这个属性包装可以将属性和方法标记为只能在主线程上访问。提案 SE-0316 Global actors
 Sendable 协议和 @Sendable 属性包装，目的是支持安全的将数据从一个线程传给另一个线程。Swift 的核心数据类型比如字符、集合等已符合 Sendable 协议。提案 SE-0302 Sendable and @Sendable closures
 局部变量可以使用 lazy。
 属性包装可以用到函数和闭包参数上。提案SE-0293 Extend Property Wrappers to Function and Closure Parameters
 泛型支持静态成员查找。提案 SE-0299 Extending Static Member Lookup in Generic Contexts
 #if 用于后缀成员表达式。提案见 SE-0308 #if for postfix member expressions
 CGFloat 和 Double 之间可以隐式转换。提案 SE-0307 Allow interchangeable use of CGFloat and Double types
 Codable 支持关联值枚举。提案 SE-0295 Codable synthesis for enums with associated values

 
 */


class study4: UIViewController {
    
    
    deinit {
        
    }
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color_bg_FAFAFA
        // Do any additional setup after loading the view.
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
extension study4:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        
    }
    func setupUI() {
        
    }
    func setupData() {
        //swift 2.0
        let test : String? = ""
        
        //需要放在return,需要执行到defer才会生效
        defer {
            printLog("延后执行")
        }
        
        guard let a = test else {
            printLog("进入else ")
            return
        }
        printLog("succese \(a)")

        
        let arr = [1,2,3,"",4] as [Any]
        //不满足条件就停止遍历
        let prefix =  arr.prefix {$0 is Int}
        printLog(prefix)
        
        //不满足条件之后的那些数据
        printLog(arr.drop{ $0 is Int})
        
        //遵循equate
        struct A : Equatable {
            var name : String = ""
            
        }
        
        //equatable
        let atest = A(name: "a")
        
        let btest = A(name: "a")
        
        if atest == btest {
            printLog("yes")
        }else {
            printLog("no")
        }
        
        
        struct B : Codable {
            var id : String = ""
            var name : String = ""
            var grade : String = ""
        }
        
        //codeable
        let b = B(id: "1", name: "work", grade: "2")
        
        do {
            let jsonData = try JSONEncoder().encode(b)
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            printLog(jsonString)
        }catch {
            printLog(error.localizedDescription)
        }
        
        //字典新增mapValues
        let param = ["name":"stone","age":"30","sex":"male"]
        
//        printLog(param.mapValues{$0 ?? "" + "1"})
        
        //判断集合是否满足一个条件
        printLog(arr.allSatisfy{$0 is Int})
        
        //过滤+map
        printLog(param.compactMapValues{$0})
        
        //map 满足条件的新字典
        printLog(param.compactMapValues(Int.init))

        
        
        let base = "hello world!"
        let theirs = "welcome to STSpace"
        
        let baseWords = base.components(separatedBy: " ")
        let theirWords = theirs.components(separatedBy: " ")
        //有序集合的 diff，通过 difference(from:) 方法，可以返回要删除哪些和添加哪些项目能够让两个集合相等
        let diff = theirWords.difference(from: baseWords)
        
        printLog(diff)
        
        guard let mergeWords =  baseWords.applying(diff) else {
            printLog("merge conflict")
            return
        }
        
        let patched = mergeWords.joined(separator: " ")
        printLog("mergeWord = \(patched)")
        
        
        //属性包装
        let rbsa = RBS.buildBlock(
            1,
            2,
            3
        )
        printLog("rbs.block = \(rbsa)")
        
        
        printLog("rbs.f1 = \(f1())")
        
        printLog("rbs.f3 = \(f3())")
        

        //动态成员查询
        let d = D()
        let s1: String = d.one
        print(s1) // first
        let i1: Int = d.one
        print(i1) // 1
        d.show("something") // show something
        print(d.p) // ["This is a member"]
        let dynamicP:[String] = d.dp
        print(dynamicP) // ["This is a dynamic member"]
        
        //动态调用
        let e = E()
        printLog(e(numbseIs:2))
        
        printLog(e("hi"))
        
    }
    
    @RBS func f1() -> Int{
        1
        2
        3
    }
    
    
    @RBS func f3() -> Int {
        for i in 1...3 {
            i * 2
            5
        }
        8
    }
    
}



//MARK: - 代理
extension study4 {
    
    
}

//属性包装， 支持对改类进行属性再次包装
@resultBuilder
struct RBS {
    static func buildBlock(_ components: Int...) -> Int {
        components.reduce(0) { partialResult, i in
            partialResult + i
        }
    }
    
    static func buildArray(_ components: [Int]) -> Int {
        components.reduce(0) { partialResult, i in
            partialResult + i
        }
    }
    
    
}



//动态成员查询
@dynamicMemberLookup
struct D {
    // 找字符串
    subscript(dynamicMember m: String) -> String {
        let p = ["one": "first", "two": "second"]
        return p[m, default: ""]
    }
    // 找整型
    subscript(dynamicMember m: String) -> Int {
        let p = ["one": 1, "two": 2]
        return p[m, default: 0]
    }
    // 找闭包
    subscript(dynamicMember m: String) -> (_ s: String) -> Void {
        return {
            print("show \($0)")
        }
    }
    // 静态数组成员
    var p = ["This is a member"]
    // 动态数组成员
    subscript(dynamicMember m: String) -> [String] {
        return ["This is a dynamic member"]
    }
}


//动态调用
@dynamicCallable
struct E {
    // 带参数说明
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) -> Int {
        let firstArg = args.first?.value ?? 0
        return firstArg * 2
    }
    
    // 无参数说明
    func dynamicallyCall(withArguments args: [String]) -> String {
        var firstArg = ""
        if args.count > 0 {
            firstArg = args[0]
        }
        return "show \(firstArg)"
    }
}







