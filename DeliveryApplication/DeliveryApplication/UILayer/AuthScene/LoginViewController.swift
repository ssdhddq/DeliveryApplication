//
//  LoginViewController.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 10.02.2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottomView = BottomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    func facebookPress() {
        print("facebook")
    }
    
    func googlePress() {
        print("google")
    }
}

private extension LoginViewController {
    func setupLayout() {
        setupBottomView()
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button2Action = facebookPress
        bottomView.button1Action = googlePress
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

#Preview("LoginVC") {
    LoginViewController()
}
