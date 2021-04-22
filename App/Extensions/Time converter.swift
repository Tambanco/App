//
//  Time converter.swift
//  App
//
//  Created by tambanco 🥳 on 21.04.2021.
//

import UIKit

// MARK: - Time converter
extension PaymentViewCell
{
    func timeConverter(_ inputTimeStamp: Double) -> String
    {
        let date = Date(timeIntervalSince1970: inputTimeStamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
