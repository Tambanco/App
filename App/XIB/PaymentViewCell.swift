//
//  PaymentViewCell.swift
//  App
//
//  Created by tambanco 🥳 on 17.04.2021.
//

import UIKit

class PaymentViewCell: UITableViewCell
{
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib()
    {
    super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool)
    {
    super.setSelected(selected, animated: animated)
    }
}
