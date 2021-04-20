//
//  Label configurator.swift
//  App
//
//  Created by tambanco 🥳 on 20.04.2021.
//

import UIKit

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
    
    let loginTextField = UITextField(frame: CGRect(x: 20, y: heightOfView * 0.7, width: widthOfElement, height: heightOfElement))
        loginTextField.placeholder = "Enter login here"
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        loginTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        loginTextField.clearButtonMode = .whileEditing
        loginTextField.autocorrectionType = .no
        loginTextField.autocapitalizationType = .none
        loginTextField.keyboardType = .asciiCapable
        loginTextField.layer.borderWidth = 2
        loginTextField.layer.cornerRadius = cornerRadius
        loginTextField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
        loginTextField.layer.shadowOpacity = 1
        loginTextField.layer.shadowRadius = 4.0
        loginTextField.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        loginTextField.addTarget(self, action: #selector(self.loginTextFieldDidChange(_:)), for: .editingChanged)
    
        elementAnimator(loginTextField)
    self.view.addSubview(loginTextField)
    
    let passwordTextField = UITextField(frame: CGRect(x: 20, y: heightOfView * 0.77, width: widthOfElement, height: heightOfElement))
        passwordTextField.placeholder = "Enter password here"
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.keyboardType = .asciiCapable
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.cornerRadius = cornerRadius
        passwordTextField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
        passwordTextField.layer.shadowOpacity = 1
        passwordTextField.layer.shadowRadius = 4.0
        passwordTextField.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        passwordTextField.addTarget(self, action: #selector(self.passwordTextFieldDidChange(_:)), for: .editingChanged)
    
        elementAnimator(passwordTextField)
    self.view.addSubview(passwordTextField)
}

@objc func loginTextFieldDidChange(_ textField: UITextField)
{
    guard textField.text != "" else
    {
        return textField.layer.borderColor = #colorLiteral(red: 0.9882510304, green: 0.3398481607, blue: 0.01567719691, alpha: 1)
    }
    
    textField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
    login = textField.text ?? "text doesn't exist"
}

@objc func  passwordTextFieldDidChange(_ textField: UITextField)
{
    guard textField.text != "" else
    {
        return textField.layer.borderColor = #colorLiteral(red: 0.9882510304, green: 0.3398481607, blue: 0.01567719691, alpha: 1)
    }
    
    textField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
    password = textField.text ?? "text doesn't exist"
}
}
