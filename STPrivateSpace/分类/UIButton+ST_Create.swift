//
//  UIButton+ST_Create.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2022/2/22.
//

import Foundation
import UIKit



//extension UIButton {
//
//    class func create(_ title:String = "",titleFont:CGFloat = 13,titleColor:UIColor = .black,backgroudColor:UIColor = .white,topOffset:CGFloat = 10,leftOffset:CGFloat = 15,coreRadius:CGFloat = 0,borderColor:UIColor? = nil,borderWidth:CGFloat = 0.5) -> UIControl {
//
//        let btn = sizeFitBtn(frame: .zero)
//        btn.setTitle(title, for: .normal)
//        btn.setTitle(title, for: .highlighted)
//
//        btn.setTitleColor(titleColor, for: .normal)
//        btn.setTitleColor(titleColor, for: .highlighted)
//
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: titleFont)
//
//        if let borderColor = borderColor {
//            btn.layer.borderColor =  borderColor.cgColor
//            btn.layer.borderWidth = borderWidth
//        }
//
//        btn.leftOffset = leftOffset
//        btn.topOffset = topOffset
//
//
//        return btn
//    }
//
//}
//
//
//class sizeFitBtn : UIControl {
//    var fitWidth:CGFloat {
////        get {
////
////
////        }
//    }
//    var fitHeight:CGFloat {
////        get {
////
////        }
//
//    }
//
//    var topOffset:CGFloat = 10 {
//        didSet {
//            updateUI()
//        }
//    }
//    var leftOffset:CGFloat = 15 {
//        didSet {
//            updateUI()
//        }
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//
//
//    private func setupUI() {
//        self.addSubview(titleLabel)
//        titleLabel.snp_makeConstraints { make in
//            make.top.equalTo(10)
//            make.left.equalTo(15)
//            make.bottom.equalTo(-10)
//            make.right.equalTo(-15)
//        }
//    }
//
//    private func updateUI() {
//        if leftOffset >= 0 && topOffset >= 0 {
//            titleLable.snp_updateConstraints { make in
//                make.top.equalTo(topOffset)
//                make.left.equalTo(leftOffset)
//                make.bottom.equalTo(-topOffset)
//                make.right.equalTo(-leftOffset)
//            }
//        }
//    }
//
//
//    let titleLabel = UILabel.create(text: "",textColor: .black)
//
//}
