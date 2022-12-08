//
//  ViewController.swift
//  ChatRoom
//
//  Created by Kun Niu on 12/1/22.
//

import UIKit

import Firebase


class LoginViewController: UIViewController {

    
    let vm = ChatVM()

    lazy var emailTextField: UITextField = {
        let email = UITextField(frame: .zero)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "kun000.niu@gmail.com"
        email.backgroundColor = .cyan
        email.clearsOnInsertion = true

        
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let pass = UITextField(frame: .zero)
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.text = "kun123"
        pass.backgroundColor = .cyan
        pass.clearsOnInsertion = true
        pass.isSecureTextEntry = true
        
        return pass
    }()
    
    lazy var signInButton: UIButton = {
        let butt = UIButton(frame: .zero)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.setTitle("Sign in", for: .normal)
        butt.backgroundColor = .cyan
        butt.addTarget(self, action: #selector(buttPressed), for: .touchUpInside)
        
        return butt
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func createUI() {
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(signInButton)
        
        self.emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.emailTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.emailTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        self.emailTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.emailTextField.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -26).isActive = true
        
        self.passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.passwordTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.passwordTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        self.passwordTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.passwordTextField.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 26).isActive = true
        
        
        self.signInButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.signInButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.signInButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        self.signInButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.signInButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 8).isActive = true
            }
    
    @objc
    func buttPressed() {
        guard let email = emailTextField.text?.lowercased() else {return}
        guard let password = passwordTextField.text?.lowercased() else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let err = error {
                print("error signing in\(err)")
            } else {
                //next screen
                
                let vc = ChatViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                print("success signing in")

            }
        }
    }

}
