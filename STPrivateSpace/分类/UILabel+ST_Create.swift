//
//  UILabel+Create.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/9.
//

import Foundation
import UIKit

extension UILabel {
    static func create(text:String,textColor :UIColor? = UIColor.black
                       ,font:UIFont? = UIFont.systemFont(ofSize: 13),bgColor:UIColor? = .clear,textAliment:NSTextAlignment? = .left,numberLines:Int? = 1) -> UILabel {
        
        let label = UILabel()
        
        label.text = text
        if textColor != nil {
            label.textColor = textColor
        }
        if bgColor != nil {
            label.backgroundColor = bgColor
        }
        if font != nil {
            label.font = font
        }
        if textAliment != nil {
            label.textAlignment = textAliment!
        }
        if numberLines != nil {
            label.numberOfLines = numberLines!
        }
        
        return label
    }
    
    
}
