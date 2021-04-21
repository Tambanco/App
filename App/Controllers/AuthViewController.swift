//
//  ViewController.swift
//  App
//
//  Created by tambanco 🥳 on 16.04.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class AuthViewController: UIViewController
{
    // MARK: - Properties
    let basicURL = "http://82.202.204.94/api-test/"
    var login = ""
    var password = ""
    var successResult = false
    var token = ""
    var payments: [Payments] = []
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        configureAppName()
        configureImage()
        configureLabels()
        configureButtons()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

    // MARK: - Networking managers
extension AuthViewController
{
    func makePostRequest(basicURL: String, login: String, password: String)
    {
        guard URL(string: basicURL) != nil else {return}
        let urlForLogin = String(basicURL + "login")
        let parameters = ["login" : login, "password" : password]
        let headers: HTTPHeaders = ["app-key" : "12345", "v" : "1"]
        AF.request(urlForLogin, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { [self] response in
            switch response.result
            {
            case .success(let value):
                let json = JSON(value).dictionaryValue
                successResult = json["success"]?.boolValue ?? false
                token = json["response"]?["token"].stringValue ?? "token is missing"
                
                guard successResult != false else
                {
                    return showAlert(alertText: "Login Failed", alertMessage: "Check your login data and try again")
                }
                getPaymentData(basicURL: basicURL, token: token)
                
                
            case .failure(let error):
               print(error)
            }
        }
    }
    
    func getPaymentData(basicURL: String, token: String)
    {
        guard URL(string: basicURL) != nil else {return}
        let urlForPayments = basicURL + "payments"
        let parameters = ["token" : token]
        let headers: HTTPHeaders = ["app-key" : "12345", "v" : "1"]
        AF.request(urlForPayments, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { [self] response in
            switch response.result
            {
            case .success(let value):
                let json = JSON(value)
                showPaymentsList(jsonData: json)
                
            case .failure(let error):
               print(error)
            }
        }
    }
}

    // MARK: - Show payments list
extension AuthViewController
{
    func showPaymentsList(jsonData: JSON)
    {
        if jsonData.exists()
        {
            let rawPaymentsList = jsonData["response"].arrayValue
                if rawPaymentsList.count > 0
                {
                    parseJSON(paymentsList: rawPaymentsList)
                }
        }
    }
}

    // MARK: - Parse JSON
extension AuthViewController
{
    func parseJSON(paymentsList: [JSON])
    {
        paymentsList.forEach( { payments.append( Payments(  currency: $0["currency"].string ?? " - ",
                                                            created: $0["created"].double ?? 0,
                                                            desc: $0["desc"].string ?? " - ",
                                                            amount: $0["amount"].double ?? 0.0 )) })
        
        let paymentVC = storyboard?.instantiateViewController(identifier: "PaymentViewController") as! PaymentViewController
        paymentVC.paymentList = payments
        paymentVC.modalPresentationStyle = .fullScreen
        present(paymentVC, animated: true, completion: nil)
    }
}
    // MARK: - Passing data methods
extension AuthViewController
{
    @objc func buttonTapped(sender : UIButton)
    {
        self.view.endEditing(true)
        flashButtonAnimation(sender)
        makePostRequest(basicURL: basicURL, login: login, password: password)
    }
}

   

  
    
