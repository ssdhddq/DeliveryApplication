//
//  FDTextField.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 11.02.2025.
//

import UIKit

class FDTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        setuoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setuoLayout() {
        self.layer.cornerRadius = 24
        self.backgroundColor = AppColors.gray
        self.font = UIFont.Roboto.regular.size(14)
        self.placeholder = "Text to inputs"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
