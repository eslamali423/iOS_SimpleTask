//
//  LoginViewController.swift
//  Task
//
//  Created by Eslam Ali  on 17/04/2022.
//

import UIKit

class LoginViewController: UIViewController {
 
    //MARK:- Username and Password Constant
 private   struct Constant {
    static let username = "Eslam.ali423"
    static let password = "password"
    }
    

    
    //MARK:- Outlets
    
    private let welcomeLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.text = "Hello Again! "
        return label
    }()
    
    private let welcomeMessageLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Welcome back to your second home!"
        return label
    }()
    
    private let usernameField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true

        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
      
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    
    private let passwordField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    
    private let recoverPasswordLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "Recovery Password"
        return label
    }()
    
    private  let signInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 20, weight : .medium)
        button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)

        return button
    }()
    
 
    private let notAmemberLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Not a member?"
        return label
    }()
    
    public let registrationButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register now ", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight : .bold)
        return button
    }()
    
    private let stackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeMessageLabel)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(recoverPasswordLabel)
        view.addSubview(signInButton)
        view.addSubview(stackView)

        stackView.addArrangedSubview(notAmemberLabel)
        stackView.addArrangedSubview(registrationButton)
    
        configureConstraints()
        
        
    }
    
   
    
    
    //MARK:- Layout Constraints
    
    func configureConstraints(){
        NSLayoutConstraint.activate([
            
           welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
           welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
           welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
          
           
            welcomeMessageLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 15),
            welcomeMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            welcomeMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            usernameField.topAnchor.constraint(equalTo: welcomeMessageLabel.bottomAnchor,constant: 40),
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            usernameField.heightAnchor.constraint(equalToConstant: 70),

           passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor,constant: 10),
           passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
           passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
           passwordField.heightAnchor.constraint(equalToConstant: 70),
          
            recoverPasswordLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 10),
            recoverPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            signInButton.topAnchor.constraint(equalTo: recoverPasswordLabel.bottomAnchor,constant: 30),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 70),
            
            
            stackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor,constant: 40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         
      
        ])
    }
    
    //MARK:- Configure Sign In Button
    @objc func didTapSignInButton() {
        
        print("button pressed")
        guard let username = usernameField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            //TODO:- show error messaage in progress (ALL Fields Are Requierd)
            return
        }
        if username == Constant.username && password == Constant.password {
          
            
            // Navigate To Home View Controller 
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let HomeVc = storyboard.instantiateViewController(withIdentifier: "ContainerTabBarController") as! ContainerTabBarController
            HomeVc.modalPresentationStyle = .fullScreen
            self.present(HomeVc, animated: true)
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
            
        }else {
            // TODO:- Show Custom Error Message
            print("Error Login")
        }
        
        

        
        
        
    }
    



}
