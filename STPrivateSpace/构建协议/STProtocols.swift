//
//  STProtocols.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/9.
//

import Foundation


protocol STVCProtocol {
    func setupData() //获取数据
    func setupUI()  //添加视图控件
    func addConstraints()   //添加约束
    func bindViewModel()    //绑定viewmodel
    func eventInit()    //事件
}

protocol STViewProtocol {
    func refreshUI() //获取数据
    func setupUI()  //添加视图控件
    func addConstraints()   //添加约束
    func eventInit()    //事件
}
