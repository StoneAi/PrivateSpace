//
//  Study5.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2022/2/18.
//

import Foundation
import UIKit
import Combine
/**
 
 Combine 主要用来处理异步的事件和值。苹果 UI 框架都是在主线程上进行 UI 更新，Combine 通过 Publisher 的 receive 设置回主线程更新UI会非常的简单。

 已有的 RxSwift 和 ReactiveSwift 框架和 Combine 的思路和用法类似。

 Combine 的三个核心概念

 发布者
 订阅者
 操作符
 
 
 */

class study5: UIViewController {
    
    
    deinit {
        
    }
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        addConstraints()
        eventInit()
        self.view.backgroundColor = Color_bg_FAFAFA

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
extension study5:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        
    }
    func setupUI() {
        
    }
    func setupData() {
        
        
        let pA = Just([0,1])
        
        let _ = pA.sink{
            printLog("pA is \($0)")
        }
        
        
        
        let pB = [1,2,3,4].publisher
        
        let _ = pB.sink{
            printLog("pB is \($0)")
        } 
        
        class AClass {
            var p:Int = 0 {
                didSet {
                    printLog("property update to \(p)")
                }
            }
        }
        
        let o = AClass()
        
        let _ = pB.assign(to:\.p , on: o)
        
        
        setupData1()
    }
    
    
    func setupData1() {
        
        
        var cc = Set<AnyCancellable>()
        struct S {
            let p1: String
            let p2: String
        }

        enum CError: Error {
            case aE, bE
        }
        let ps1 = PassthroughSubject<S, CError>()
        ps1
            .sink { c in
                print("completion:", c) // send 了 .finished 后会执行
            } receiveValue: { s in
                print("receive:", s)
                
            }
            .store(in: &cc)

        
        
        ps1.send(S(p1: "1", p2: "one"))
        ps1.send(completion: .finished) // 和 .finished 一样后面就不会发送了
        ps1.send(S(p1: "2", p2: "two"))
        ps1.send(completion: .finished)
        ps1.send(S(p1: "3", p2: "three"))
        
        
        /**
         PassthroughSubject
         PassthroughSubject 可以传递多值，订阅者可以是一个也可以是多个，send 指明 completion 后，订阅者就没法接收到新发送的值了
         
         append
         append 会在发布者发布结束后追加发送数据，发布者不结束，append 的数据不会发送。
         
         */
        var aa = Set<AnyCancellable>()

        let pb = PassthroughSubject<String, Never>()

        let sb = pb
            .print("sb")
            .append("five", "six")
            .sink {
                print($0)
            }

        sb.store(in: &aa)

        pb.send("one")
        pb.send("two")
        pb.send("three")
        pb.send(completion: .finished)
        
        
        //Scheduler
        //Scheduler 处理队列。
        let sb1 = ["one","two","three"].publisher
            .print("sb1")
            .subscribe(on: DispatchQueue.global())
            .handleEvents(receiveOutput: { v in
                DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                    print("receiveOutput",v)
                }
            })
            .receive(on: DispatchQueue.main)
            .sink {
                print($0)
            }
        sb1.store(in: &cc)
        
    }
    
}

//MARK: - 代理
extension study5 {
    
    
}



