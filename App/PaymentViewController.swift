//
//  PaymentViewController.swift
//  App
//
//  Created by tambanco 🥳 on 17.04.2021.
//

import UIKit
class PaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var usersArray : Array =    [["data": "17.04.2021", "time": "09:20", "amout": "1200"],
                                 ["data": "16.04.2021", "time": "11:40", "amout": "5600"],
                                 ["data": "15.04.2021", "time": "02:30", "amout": "304"],
                                 ["data": "14.04.2021", "time": "15:20", "amout": "1100"],
                                ]
    
    @IBOutlet weak var tblUsers: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "PaymentViewCell", bundle: nil)
        self.tblUsers.register(nib, forCellReuseIdentifier: "PaymentViewCell")
    }
    
    // MARK: - UITableView delegate
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return usersArray.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return 100
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentViewCell", for: indexPath) as! PaymentViewCell
            let dict = usersArray[indexPath.row]
            
            cell.dataLabel.text = dict["data"]
            cell.timeLabel.text = dict["time"]
            cell.amountLabel.text = dict["amout"]
            
            return cell
        }
}
