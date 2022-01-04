//
//  study2.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/13.
//

/**
 *  枚举和结构体
 *  使用 struct 来创建一个结构体。结构体和类有很多相同的地方，包括方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用
 *  递归枚举
 *
 *  协议和扩展
 *
 *  错误处理
 *  使用采用 Error 协议的类型来表示错误。
 *
 *
 *  泛型
 *  在尖括号里写一个名字来创建一个泛型函数或者类型。
 *
 *
 */
import Foundation
import UIKit
class study2: UIViewController,ExampleProtocol {
    var simpleDescription: String = "study2 class"
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted"
    }
    
    
    
    deinit {
        
    }
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        addConstraints()
        eventInit()
        setupData()
        self.view.backgroundColor = Color_bg_FAFAFA

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
extension study2:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        
    }
    func setupUI() {
        
    }
    func setupData() {
       let _ = compareRankRawvalue(a: Rank.ace, b: Rank.jack)
        
        if let conveertedRank = Rank(rawValue: 3) {
            let _ = conveertedRank.simpleDescription()
        }
        
        
        let threeOfSpades = Card(rank: .three, suit: .spades)
        let _ = threeOfSpades.simpleDescription1()
        
        
        do {
            


            
            let printerResponse =  try send(job: 1024, toPrinter: "Never Has Toner")
            print("response = \(printerResponse)")
            
            //try? 将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 nil。否则，结果会是一个包含函数返回值的可选值。
//            let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
//            let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
            
        }catch PrintError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        }catch let x as PrintError {
            print("Printer error: \(x).")
        }catch {
            print(error)
        }
        
        let _ = makeArray(repeating: "knock", numberOfTimes: 4)
        
        print("结果 \(anyCommonElements([1,2,3], [2]))")
        
        print("重复元素 \(anyComonContainElements([1,2,3], [2,1]))")
        
        
        let five = ArithmeticExpression.number(5)
        
        let four = ArithmeticExpression.number(4)
        
        let sum = ArithmeticExpression.addition(five, four)
        
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        
        print("\(evaluate(product))")
    }
    
    func evaluate(_ expression:ArithmeticExpression) ->  Int {
        switch expression {
        case .number(let value):
            return value
        case .addition(let arithmeticExpression1, let arithmeticExpression2):
            return evaluate(arithmeticExpression1) + evaluate(arithmeticExpression2)
        case .multiplication(let arithmeticExpression3, let arithmeticExpression4):
            return evaluate(arithmeticExpression3) * evaluate(arithmeticExpression4)
        }
        
    }
}

//MARK: - 代理
extension study2 {
    
    func compareRankRawvalue(a : Rank , b : Rank) -> Bool {
        
        if a.rawValue > b.rawValue {
            return true
        }else {
            return false
        }
        
    }
    
    func send(job:Int , toPrinter printerName:String ) throws -> String {
        if printerName == "Never Has Toner" {
            throw PrintError.noToner
        }
        return "Job sent"
    }
    
    func makeArray<Item>(repeating item:Item, numberOfTimes:Int) -> [Item] {
        var result = [Item]()
        for _ in 0 ..< numberOfTimes {
            result.append(item)
        }
        return result
    }
    
    func anyCommonElements<T:Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable , T.Iterator.Element == U.Iterator.Element {
            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        return true
                    }
                }
                
            }
            return false
    }
    
    func anyComonContainElements<T:Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element] where T.Iterator.Element: Equatable , T.Iterator.Element == U.Iterator.Element {
        var items = [T.Element]()
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    if !items.contains(lhsItem) {
                        items.append(lhsItem)
                    }
                }

            }
        }
        return items
    }
}



enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit : ExampleProtocol {
    var simpleDescription: String {
        return "enum protocol"
    }
    
    mutating func adjust() {
        print("\(simpleDescription)"+"(addjusted)")
    }
    
    case spades, hearts, diamonds, clubs
    func simpleDescription1() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

extension Suit {
    func color() -> String {
        switch self {
        case .spades,.clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
        }
    }
}



struct Card : ExampleProtocol{
    var simpleDescription: String = " card struct "
    
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
    
    var rank:Rank
    var suit:Suit
    
    func simpleDescription1() -> String {
        "The \(rank.simpleDescription()) of \(suit.simpleDescription1())"
    }
    
}


protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}


enum PrintError: Error {
    case outOfPaper
    case noToner
    case onFire
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression,ArithmeticExpression)
    case multiplication(ArithmeticExpression,ArithmeticExpression)
}
