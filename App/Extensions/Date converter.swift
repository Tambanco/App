//
//  Date converter.swift
//  App
//
//  Created by tambanco 🥳 on 21.04.2021.
//

import UIKit

// MARK: - Date converter
extension PaymentViewCell
{
    func dateConverter(_ inputTimeStamp: Double) -> String
    {
        let date = Date(timeIntervalSince1970: inputTimeStamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter.string(from: date)
    }
}
