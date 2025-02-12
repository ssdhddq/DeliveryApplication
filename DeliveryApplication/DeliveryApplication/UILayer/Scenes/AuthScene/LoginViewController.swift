//
//  LoginViewController.swift
//  DeliveryApplication
//
//  Created by SSDHDDQ on 10.02.2025.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
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
    var viewOutput: LoginViewOutput?
    
    //MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPass = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    
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

//MARK: - Layout
private extension LoginViewController {
    func setupLayout() {
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomView()
            setupStack()
            setupSignInPassword()
            setupSignInUsername()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        case .signUp:
            setupBottomView()
            setupStack()
            setupSignUpPass()
            setupSignUpUsername()
            setupTitleLabel()
            setupSignUpReEnterPass()
            setupSignInButton()
            setupForgotLabel()
        }
    }
    
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        switch state {
        case .initial:
            return
        case . signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -262),
            ])
        case .signUp:
            verticalStack.addArrangedSubview(signUpReEnterPass)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpUsername)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -227),
            ])
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
    
    func setupSignInUsername() {
        //view.addSubview(signInUsername)
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        signInUsername.placeholder = "Username"
        
        NSLayoutConstraint.activate([
            signInUsername.heightAnchor.constraint(equalToConstant: 50),
            signInUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(24)
        
        switch state {
        case .signIn:
            titleLabel.text = "Sign In"
        case .signUp:
            titleLabel.text = "Sign Up"
        case .initial:
            return
        }
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
    }
    
    func setupSignInPassword() {
        //view.addSubview(signInPassword)
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        
        NSLayoutConstraint.activate([
            signInPassword.heightAnchor.constraint(equalToConstant: 50),
            signInPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            signInPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .hamburger)
        logoImage.layer.cornerRadius = 24
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
        ])
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.scheme = .orange
        signInButton.action = onSignInTapped
        
        switch state {
        case .initial:
            signInButton.setTitle("Sign in")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
            ])
        case .signIn:
            signInButton.setTitle("Sign in")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
            ])
        case .signUp:
            signInButton.setTitle("Sign Up")
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .gray
        signUpButton.action = onSignUpTapped
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot Password?"
        forgotLabel.font = .Roboto.regular.size(14)
        forgotLabel.textColor = AppColors.lineGray
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
    }
    
    func setupSignUpPass() {
        //view.addSubview(signUpPassword)
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter Password"
        
        NSLayoutConstraint.activate([
            signUpPassword.heightAnchor.constraint(equalToConstant: 50),
            signUpPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            signUpPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
        ])
    }
    
    func setupSignUpUsername() {
        //view.addSubview(signUpUsername)
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter Username"
        
        NSLayoutConstraint.activate([
            signUpUsername.heightAnchor.constraint(equalToConstant: 50),
            signUpUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            signUpUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
        ])
    }
    
    func setupSignUpReEnterPass() {
        //view.addSubview(signUpReEnterPass)
        signUpReEnterPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPass.placeholder = "Re-enter Password"
        
        NSLayoutConstraint.activate([

            signUpReEnterPass.heightAnchor.constraint(equalToConstant: 50),
            signUpReEnterPass.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            signUpReEnterPass.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
        ])
    }
}

//MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput?.goToSignIn()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput?.goToSignUp()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}

#Preview("LoginVC") {
    LoginViewController(viewOutput: LoginPresenter(), state: .signUp)
}
