//
//  Button configurator.swift
//  App
//
//  Created by tambanco 🥳 on 20.04.2021.
//

import UIKit

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
}
