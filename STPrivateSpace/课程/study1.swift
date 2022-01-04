//
//  First.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/9.
//

import Foundation
import UIKit

/**
 *  1.  使用"""  ”“”   使用一对三个单引号（"""）来包含多行字符串内容，字符串中的内容（包括引号、空格、换行符等）都会保留下来
 *  2.  可以一起使用 if 和 let 一起来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者是 nil 以表示值缺失
 *  3.  switch 支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等
 *  4. 函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
 */



class study1: UIViewController {
    
    
    deinit {
        
    }
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第一课"
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
    let label = UILabel.create(text: "",numberLines: 0)
    //MARK: - 懒加载
    let label1 = UILabel.create(text: "",numberLines: 0)
    let label2 = UILabel.create(text: "",numberLines: 0)

    
}

//MARK: - 事件以及布局
extension study1:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        label.snp_makeConstraints { make in
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(100)
            make.left.equalTo(15)
        }
        
        label1.snp_makeConstraints { make in
            make.centerX.equalTo(self.view.snp_centerX)
            make.left.equalTo(15)
            make.top.equalTo(label.snp_bottom).offset(15)

        }
        
        label2.snp_makeConstraints { make in
            make.centerX.equalTo(self.view.snp_centerX)
            make.left.equalTo(15)
            make.top.equalTo(label1.snp_bottom).offset(15)

        }
    }
    func setupUI() {
        self.view.addSubview(label)
        self.view.addSubview(label1)
        self.view.addSubview(label2)
    }
    func setupData() {
        
        let apples = 3
        let oranges = 5
        let quotation = """
        I said "I have \(apples) apples."
        And then I said "I have \(apples + oranges) pieces of fruit.
        """
        label.text = quotation
        
        //--------------------------------
        
        
        var optionName :  String? = "Stone"
        
        var greeting = "Hello!"
        

        if let name = optionName {
            greeting =  "Hellp,\(name)"
        }
        label1.text = greeting

        optionName = nil
        if let name = optionName {
            greeting =  "Hello,\(name)"
        }else {
            greeting =  "Hello,null"
        }
        
        label2.text = greeting

        //--------------------------------

        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
        
        //-------------------------------- 函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
        
        print("嵌套函数 ---- 返回值\(returnFifteen())")
        //--------------------------------  函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
        let add = makeIncrementer()
        print("函数的返回值 ---- 返回值\(add(2))")
        //--------------------------------  函数也可以当做参数传入另一个函数。
        
        let _ = hasAnyMatchhes(list: [1,2,3,4,5,6]) { item in
            if item > 5 {
                return true
            }else {
                return false
            }
        }
        //-------------------------------- 重写闭包，对所有奇数返回 0。
        let numbers = [1,3,4,5,6,7,8,9]
        let newNums = numbers.map({
            (number : Int) -> Int in
            if number%2 == 0 {
                return number
            }else {
                return 0
            }
        })
        print("newNumbs \(newNums)")
        
        
    }
}


extension study1 {
    func returnFifteen() ->  Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    
    func makeIncrementer() -> ((Int) -> (Int)) {
        func addOne(number:Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    func hasAnyMatchhes(list:[Int], condition: (Int) -> (Bool)) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
            
        }
        return false
    }
    
    //所有奇数返回0
    
}
