//
//  CurryingVC.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/9.
//

import Foundation
import UIKit

class CurryingVC:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "柯里化"
        self.view.backgroundColor = Color_bg_FAFAFA
        //柯里化体现
        //柯⾥化是⼀种量产相似⽅法的好办法，可以通过柯⾥化⼀个⽅法模板来避免写出很多重复代码， 也⽅便了今后维护。
        let curryingAddTwo  = currying.curryingAddTo(2) //返回值为（num）-> (int)
        let result = curryingAddTwo(6) // 2 + 6
        print("relust = \(result)")
        
        let curryingCompareTwo  = currying.curryingCompare(1) //传入作为比较的参数
        let compareBool = curryingCompareTwo(3) // 用3去和1比较
        
        print("compare = \(compareBool)")
        
        let curryingVoid = currying.curryingVoid(self.classForCoder)
        curryingVoid()
        
        
        let button = Control()
        button.setTarget(target: self, action: { target in
            target.btnOnClick
        }, controlEvent: .TouchUpInside)
        button.performActionForControlEvent(controlEvent: .TouchUpInside)

    }

    func btnOnClick() {
        print("触发了点击")
    }
    
}
