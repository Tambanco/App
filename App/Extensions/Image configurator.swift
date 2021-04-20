//
//  Image configurator.swift
//  App
//
//  Created by tambanco 🥳 on 20.04.2021.
//

import UIKit

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
