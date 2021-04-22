//
//  Alert configurator.swift
//  App
//
//  Created by tambanco 🥳 on 20.04.2021.
//

import UIKit

    // MARK: - Alert configurator
extension UIViewController
{
    func showAlert(alertText : String, alertMessage : String)
    {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
