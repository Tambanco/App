//
//  Animation methods.swift
//  App
//
//  Created by tambanco 🥳 on 20.04.2021.
//

import UIKit

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
