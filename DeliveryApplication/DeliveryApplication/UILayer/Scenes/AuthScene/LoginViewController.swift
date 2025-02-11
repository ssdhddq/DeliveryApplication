//
//  LoginViewController.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 10.02.2025.
//

import UIKit

enum LoginViewState {
    case initial
    case login
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private var state: LoginViewState = .initial
    weak var viewOutput: LoginViewOutput?
    
    //MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var textField = FDTextField()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    
    //MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
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
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .login:
            setupBottomView()
            setupTextField()
        case .signUp:
            setupBottomView()
            setupTextField()
        }
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
    
    func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 354),
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .appstore)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign in")
        signInButton.scheme = .orange
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign in")
        signUpButton.scheme = .gray
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}

#Preview("LoginVC") {
    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
}
