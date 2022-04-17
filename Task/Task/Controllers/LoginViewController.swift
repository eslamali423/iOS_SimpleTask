//
//  LoginViewController.swift
//  Task
//
//  Created by Eslam Ali  on 17/04/2022.
//

import UIKit

class LoginViewController: UIViewController {
 
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
        
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.cornerRadius = 30
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
        textField.layer.cornerRadius = 25
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeMessageLabel)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        
        
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
            
            usernameField.topAnchor.constraint(equalTo: welcomeMessageLabel.bottomAnchor,constant: 20),
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            usernameField.heightAnchor.constraint(equalToConstant: 70),

           passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor,constant: 10),
           passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
           passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
           passwordField.heightAnchor.constraint(equalToConstant: 70),
          
            
            
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
