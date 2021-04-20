//
//  PaymentViewCell.swift
//  App
//
//  Created by tambanco 🥳 on 17.04.2021.
//

import UIKit

class PaymentViewCell: UITableViewCell
{
    // MARK: - Outlets
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}

    // MARK: - Cell initializer
extension PaymentViewCell
{
    func initialize(_ payments: Payments)
    {
        dataLabel.text = payments.currency
        timeLabel.text = payments.currency
        paymentLabel.text = payments.desc
        amountLabel.text = payments.amount
        currencyLabel.text = payments.currency
    }
}
