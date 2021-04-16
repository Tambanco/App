//
//  ViewController.swift
//  App
//
//  Created by tambanco 🥳 on 16.04.2021.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate
{
    
    // MARK: - Properties

    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        configureAppName()
        configureImage()
        configureLabels()
        configureButtons()
    }
}

// MARK: - App name configurator
extension AuthViewController
{
    func configureAppName()
    {
        let appName = UILabel(frame: CGRect(x: 150, y: 100, width: 100, height: 50))
        appName.text = "App"
        appName.textColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
        appName.font = UIFont(name: "Helvetica Neue", size: 40)
        appName.font = UIFont.boldSystemFont(ofSize: 40)
        appName.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.view.addSubview(appName)
    }
}

// MARK: - Image configurator
extension AuthViewController
{
    func configureImage()
    {
        let imageName = "imageTree.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 40, y: 200, width: 300, height: 300)
        self.view.addSubview(imageView)
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
            loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
            loginTextField.leftViewMode = .always
            loginTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            loginTextField.clearButtonMode = .whileEditing
            loginTextField.layer.borderWidth = 2
            loginTextField.layer.cornerRadius = cornerRadius
            loginTextField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
            loginTextField.layer.shadowOpacity = 1
            loginTextField.layer.shadowRadius = 4.0
            loginTextField.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.view.addSubview(loginTextField)
        
        let passwordTextField = UITextField(frame: CGRect(x: 20, y: heightOfView - 200, width: widthOfElement, height: heightOfElement))
            passwordTextField.placeholder = "Enter your password here"
            passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
            passwordTextField.leftViewMode = .always
            passwordTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            passwordTextField.clearButtonMode = .whileEditing
            passwordTextField.isSecureTextEntry = true
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.cornerRadius = cornerRadius
            passwordTextField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
            passwordTextField.layer.shadowOpacity = 1
            passwordTextField.layer.shadowRadius = 4.0
            passwordTextField.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.view.addSubview(passwordTextField)
    }
}

// MARK: - Button configurator
extension AuthViewController
{
    func  configureButtons()
    {
        let heightOfView = view.frame.height
        let widthOfView = view.frame.width
        let heightOfElement: CGFloat = 50.0
        let widthOfElement: CGFloat = widthOfView - 40.0
        let cornerRadius: CGFloat = 10
        
        let loginButton = UIButton(frame: CGRect(x: 20, y: heightOfView - 140, width: widthOfElement, height: heightOfElement))
            loginButton.setTitle("Login", for: .normal)
            loginButton.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
            loginButton.layer.cornerRadius = cornerRadius
            loginButton.layer.shadowOpacity = 1
            loginButton.layer.shadowRadius = 4.0
            loginButton.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.view.addSubview(loginButton)
    }
}
