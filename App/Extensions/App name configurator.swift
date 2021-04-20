//
//  App name configurator.swift
//  App
//
//  Created by tambanco 🥳 on 20.04.2021.
//

import UIKit

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
