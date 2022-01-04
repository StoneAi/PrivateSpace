//
//  View.swift
//  STPrivateSpace
//
//  Created by 那不是随你 on 2021/12/9.
//

import Foundation
import UIKit

class View : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addConstraints()
        refreshUI()
        eventInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
}
//MARK: - 布局以及事件
extension View : STViewProtocol {
    func refreshUI() {
        
    }
    
    func setupUI() {
        
    }
    
    func addConstraints() {
        
    }
    
    func eventInit() {
        
    }
    
    
    
}
