//
//  ViewController.swift
//  App
//
//  Created by tambanco 🥳 on 16.04.2021.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate
{
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        configureLabels()
    }
}

// MARK: - Label configurator
extension AuthViewController
{
    func configureLabels()
    {
        let heightOfView = view.frame.height
        let widthOfView = view.frame.width
        let heightOfElement: CGFloat = 50.0
        let widthOfElement: CGFloat = widthOfView - 40.0
        let cornerRadius: CGFloat = 10
        
        let loginTextField = UITextField(frame: CGRect(x: 20, y: heightOfView - 260, width: widthOfElement, height: heightOfElement))
            loginTextField.placeholder = "Enter your login here"
            loginTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            loginTextField.layer.borderWidth = 2
            loginTextField.layer.cornerRadius = cornerRadius
            loginTextField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
        self.view.addSubview(loginTextField)
        
        let passwordTextField = UITextField(frame: CGRect(x: 20, y: heightOfView - 200, width: widthOfElement, height: heightOfElement))
            passwordTextField.placeholder = "Enter your password here"
            passwordTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.cornerRadius = cornerRadius
            passwordTextField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
        self.view.addSubview(passwordTextField)
        
        let loginButton = UIButton(frame: CGRect(x: 20, y: heightOfView - 140, width: widthOfElement, height: heightOfElement))
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
        loginButton.layer.cornerRadius = cornerRadius
        self.view.addSubview(loginButton)
    }
}
