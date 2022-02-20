//
//  study7.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2022/2/22.
//

import Foundation
import UIKit
class study7: UIViewController {
    
    
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
    let btn = UIButton(type: .custom)

    
    //MARK: - 懒加载
    
    
}

//MARK: - 事件以及布局
extension study7:STVCProtocol {
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        
    }
    func setupUI() {
        
        
//        if #available(iOS 15.0, *){
//            var config = UIButton.Configuration.bordered()
//            config.titlePadding = 50
//            config.title = "你好"
//            config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
//            btn.configuration = config
//            
//        }else {
//           
//        }
        btn.setTitle("你好", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0,left: 15,bottom: 0,right: 15)
        
        self.view.addSubview(btn)
        
        btn.snp_makeConstraints { make in
            make.center.equalTo(self.view.snp_center)
        }
        btn.addTarget(self, action: #selector(btnOnClick), for: .touchUpInside)
        
    }
    func setupData() {
        
    }
    
    @objc func btnOnClick() {
//        btn.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50)
        printLog("btn.frame = \(btn.frame)")
        printLog("titlelabel.frame = \(btn.titleLabel!.frame)")
//        printLog("btn.contentInsets = \(btn.configuration!.contentInsets)")
    }
}

//MARK: - 代理
extension study7 {
    
    
}
