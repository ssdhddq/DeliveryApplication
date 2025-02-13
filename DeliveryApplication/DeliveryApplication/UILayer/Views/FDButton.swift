//
//  FDButton.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 11.02.2025.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case gray
}

class FDButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: FDButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    init(scheme: FDButtonColorSchemes = .white) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
        
    }
    
    private func setupButton() {
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.bold.size(18)
        button.titleLabel?.textColor = AppColors.black
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor),
        ])
        
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else { return }
        action()
    }
    
    private func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
        case .white:
            button.setTitleColor(AppColors.accentOrange, for: .normal)
            button.backgroundColor = AppColors.white
        case .orange:
            button.setTitleColor(AppColors.white, for: .normal)
            button.backgroundColor = AppColors.accentOrange
        case .gray:
            button.setTitleColor(AppColors.black, for: .normal)
            button.backgroundColor = AppColors.gray
        }
    }
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}
