//
//  study3.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/17.
//
//

/**
 *  集合类型
 *  集合（Set）用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
 *
 *  闭包
 *
 *
 */
import Foundation
import UIKit
class study3: UIViewController {
    
    
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
extension study3:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        
    }
    func setupUI() {
        
    }
    func setupData() {
        
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        var reverseNames = names.sorted(by: backward)
        
        print("block reverse = \(reverseNames)")
        
        //闭包表达式语法
        reverseNames = names.sorted(by: {(s1: String, s2 : String) -> Bool in return s1 > s2})
        
        print("block reverse1 = \(reverseNames)")

        //根据上下文推断类型
        reverseNames = names.sorted(by: {(s1 , s2) in return s1 > s2})
        
        print("block reverse2 = \(reverseNames)")

        //单表达式闭包的隐式返回
        reverseNames = names.sorted(by: {s1,s2 in s1 > s2})
        
        print("block reverse3 = \(reverseNames)")

        //参数名称缩写
        reverseNames = names.sorted(by: { $0 > $1})
        
        print("block reverse3 = \(reverseNames)")
        
        //运算符方法
        reverseNames = names.sorted(by: >)
        
        print("block reverse4 = \(reverseNames)")

        
        //尾随闭包
        someFuncttionThatTakesAClosure(closure: {
            
        })
        
        // 以下是使用尾随闭包进行函数调用
        someFuncttionThatTakesAClosure() {}
        
        //闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
        someFuncttionThatTakesAClosure {}
        
    }
}

//MARK: - 代理
extension study3 {
    
    func backward(_ s1:String , _ s2: String) -> Bool {
        return s1 > s2
    }
    
    func someFuncttionThatTakesAClosure(closure:() -> Void ) {
        print("尾随闭包")
    }
    
}

