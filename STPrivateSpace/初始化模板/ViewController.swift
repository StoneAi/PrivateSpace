//
//  ViewController.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    deinit {
        
    }
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
extension ViewController:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        
    }
    func setupUI() {
        
    }
    func setupData() {
        
    }
}

//MARK: - 代理
extension ViewController {
    
    
}

