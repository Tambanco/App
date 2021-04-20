//
//  Navigation bar configurator.swift
//  App
//
//  Created by tambanco 🥳 on 20.04.2021.
//

import UIKit

// MARK: - Navigation bar configurator
extension PaymentViewController
{
func configureNavBar()
{
    let navBar = navigationController?.navigationBar
    navigationItem.title = "Payments"
    navBar?.barTintColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
    navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
}
}
