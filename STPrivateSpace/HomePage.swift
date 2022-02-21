//
//  HomePage.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/9.
//

import Foundation
import UIKit
import SnapKit

let Color_bg_FAFAFA = UIColor.withHex(hexString: "FAFAFA")

class HomePage: UIViewController {
    
    
    deinit {
        
    }
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        addConstraints()
        eventInit()
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        self.view.backgroundColor = Color_bg_FAFAFA
        self.title = "Stone"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - 属性
    
    let titles = ["柯里化","第一课","第二课","第三课","第四课","第五课","第六课"]
    
    
    //MARK: - 懒加载
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
//        view.distribution = .fillEqually
        view.spacing = 0.5
        return view
    }()
    
}

//MARK: - 事件以及布局
extension HomePage:STVCProtocol {
    
    @objc func itemeOnClick(tap:UITapGestureRecognizer) {
        let index = tap.view!.tag -  202020
        print("-------- 点击了\(index)")
        
        if index == 0 {
            self.navigationController?.pushViewController(CurryingVC.init(), animated: true)
        }else if index > 0 {
            let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]
            if let ns = nameSpace as? String {
                if let vcClass = NSClassFromString(ns+".study\(index)") as? UIViewController.Type {
                    let targetVc = vcClass.init()
                    targetVc.title = titles[index]
                    self.navigationController?.pushViewController(targetVc, animated: true)
                }else {
                    
                }
            }


        }
        
    }
    
    func eventInit() {
        
    }
    func bindViewModel() {
        
    }
    func addConstraints() {
        stackView.snp_makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom).offset(10)
            }
            make.left.right.equalTo(0)
        }
    }
    func setupUI() {
        self.view.addSubview(stackView)

        stackAddContent()
    }
    func setupData() {
        
    }
    func stackAddContent() {
        for (index, title) in titles.enumerated() {
            
            let view = UIView()
            view.backgroundColor = .white
            view.tag = 202020 + index
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(itemeOnClick)))
            stackView.addArrangedSubview(view)
            
            let label = UILabel.init(frame: .zero)
            label.text = title
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 16)
            view.addSubview(label)
            label.snp_makeConstraints { make in
                make.left.equalTo(15)
                make.top.equalTo(10)
                make.right.equalTo(-15)
                make.bottom.equalTo(-10)
            }
        }
    }
    
}

//MARK: - 代理
extension HomePage {
    
    
}





extension UIColor {
    
    static func withHex(hexString hex: String, alpha:CGFloat = 1) -> UIColor {
        // 去除空格等
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        // 去除#
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        // 必须为6位
        if (cString.count != 6) {
            return UIColor.gray
        }
        // 红色的色值
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        // 字符串转换
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
