//
//  Logout button configurator.swift
//  App
//
//  Created by tambanco 🥳 on 22.04.2021.
//

import UIKit

    // MARK: - Logout button configurator
extension PaymentViewController
{
    func configureLogout()
    {
        let heightOfView = view.frame.height
        let widthOfView = view.frame.width
        let heightOfElement: CGFloat = 40.0
        let widthOfElement: CGFloat = widthOfView - 100.0
        let cornerRadius: CGFloat = 10
        
        let loginButton = UIButton(frame: CGRect(x: 50, y: heightOfView * 0.90, width: widthOfElement, height: heightOfElement))
            loginButton.setTitle("Logout", for: .normal)
            loginButton.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
            loginButton.layer.cornerRadius = cornerRadius
            loginButton.layer.shadowOpacity = 1
            loginButton.layer.shadowRadius = 4.0
            loginButton.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            loginButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)

        self.view.addSubview(loginButton)
    }

    @objc func buttonAction(sender: UIButton!)
    {
        let authVC = storyboard?.instantiateViewController(identifier: "AuthViewController") as! AuthViewController
        authVC.modalPresentationStyle = .fullScreen
        present(authVC, animated: true, completion: nil)
    }
}
