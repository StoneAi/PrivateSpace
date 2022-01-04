//
//  Currying柯里化.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/11/15.
//



import Foundation
import QuartzCore
import UIKit
/**
 *
 *  我们提到了在 Swift 中 Selector 只能使⽤字符串在⽣成。这⾯临⼀个很严重的问题,就是难以重构,
 *  并且⽆法在编译期间进⾏检查，其实这是 ⼗分危险的⾏为。但是 target-action ⼜是 Cocoa 中如此
 *  重要的⼀种设计模式，⽆论如何我们都想 安全地使⽤的话，应该怎么办呢？
 *  ⼀种可能的解决⽅式就是利⽤⽅法的柯⾥化。
 *
 */
struct currying {
    
    /**
     * 累加
     * addr 作为与输入数字相加的数
     * 返回值 (num)->(Int)  num 为 输入数字本身
     */
    static func curryingAddTo(_ addr : Int ) -> (Int) -> Int {
       return {
           $0 + addr
       }
   }
   /**
    * 比较大小
    */
    static func curryingCompare(_ compare : Int) -> (Int) -> Bool {
       return {
           $0  > compare
       }
   }
   
    static func curryingVoid(_ T : AnyClass) -> () -> () {
        return {
            print("\(T)")
        }
    }
    
}


protocol targetAction {
    func performAction()
}

struct targgetActionWrapper<T: AnyObject> : targetAction {
    weak var target : T?
    let action :(T) -> () -> ()
    
    func performAction() -> (){
        if let t = target {
            action(t)()
        }
    }
    
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
}

class Control {
    var actions = [ControlEvent : targetAction]()
    
    func setTarget<T:AnyObject>(target:T ,action:@escaping(T) -> () -> (),controlEvent: ControlEvent) {
        actions[controlEvent] = targgetActionWrapper(target: target, action: action)
    }
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}


