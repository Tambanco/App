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
    let basicURL = "http://82.202.204.94/api-test/"
    var login = ""
    var password = ""
    
    // MARK: - Outlets
    
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        configureAppName()
        configureImage()
        configureLabels()
        configureButtons()
    }
}

    // MARK: - Networking managers
extension AuthViewController
{
    func makeGetRequest(url: String)
    {
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response
            {
                print(response)
                print(self.login)
            }
            
            guard let data = data else {return}
            print(data)
            
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch
            {
                print(error)
            }
        } .resume()
    }
    
    func makePostRequest(url: String, login: String, password: String)
    {
        guard let url = URL(string: url) else {return}
        let parameters = ["login" : login, "password" : password]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("12345", forHTTPHeaderField: "app-key")
        request.addValue("1", forHTTPHeaderField: "v")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {return}
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response
            {
                print(response)
            }
            
            guard let data = data else {return}
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch
            {
                print(error)
            }
        }.resume()
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
        appName.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        elementAnimator(appName)
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
        imageView.frame = CGRect(x: 40, y: view.frame.height * 0.3, width: view.frame.width * 0.75, height: view.frame.height * 0.35)
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
        
        let loginTextField = UITextField(frame: CGRect(x: 20, y: heightOfView * 0.7, width: widthOfElement, height: heightOfElement))
            loginTextField.placeholder = "Enter login here"
            loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
            loginTextField.leftViewMode = .always
            loginTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            loginTextField.clearButtonMode = .whileEditing
            loginTextField.autocorrectionType = .no
            loginTextField.keyboardType = .asciiCapable
            loginTextField.layer.borderWidth = 2
            loginTextField.layer.cornerRadius = cornerRadius
            loginTextField.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
            loginTextField.layer.shadowOpacity = 1
            loginTextField.layer.shadowRadius = 4.0
            loginTextField.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            loginTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
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
        
            elementAnimator(passwordTextField)
        self.view.addSubview(passwordTextField)
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        login = textField.text ?? "empty field"
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
        
        let loginButton = UIButton(frame: CGRect(x: 20, y: heightOfView * 0.85, width: widthOfElement, height: heightOfElement))
            loginButton.setTitle("Login", for: .normal)
            loginButton.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
            loginButton.layer.cornerRadius = cornerRadius
            loginButton.layer.shadowOpacity = 1
            loginButton.layer.shadowRadius = 4.0
            loginButton.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            loginButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)

            elementAnimator(loginButton)
        self.view.addSubview(loginButton)
    }
    
    @objc func buttonTapped(sender : UIButton)
    {
        self.view.endEditing(true)
        flashButton(sender)
        makePostRequest(url: basicURL, login: login, password: password)
    }
}

    // MARK: - Animation methods
extension AuthViewController
{
    func elementAnimator(_ element: UIView)
    {
        element.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.3)
        {
            element.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }
    }
    
    func flashButton(_ button: UIButton)
    {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.10
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1
        button.layer.add(flash, forKey: nil)
    }
}

    // MARK: - Dismiss keyboard methods
extension AuthViewController
{
    @objc func keyboardWillShow(notification: NSNotification)
    {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        {
            if self.view.frame.origin.y == 0
            {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification)
    {
        if self.view.frame.origin.y != 0
        {
            self.view.frame.origin.y = 0
        }
    }
}

