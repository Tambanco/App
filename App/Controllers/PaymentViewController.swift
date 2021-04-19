//
//  PaymentViewController.swift
//  App
//
//  Created by tambanco 🥳 on 17.04.2021.
//

import UIKit
class PaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    // MARK: - Properties
    var mockArray : Array =    [["data": "17.04.2021", "time": "09:20", "amout": "1200"],
                                 ["data": "16.04.2021", "time": "11:40", "amout": "5600"],
                                 ["data": "15.04.2021", "time": "02:30", "amout": "304"],
                                 ["data": "14.04.2021", "time": "15:20", "amout": "1100"],
                                ]
    
    // MARK: - Outlets
    @IBOutlet weak var tblUsers: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "PaymentViewCell", bundle: nil)
        self.tblUsers.register(nib, forCellReuseIdentifier: "PaymentViewCell")
        
        configureNavBar()
        configureNavLogoutButton()
    }
    
    // MARK: - UITableView delegate
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return mockArray.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return 70
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentViewCell", for: indexPath) as! PaymentViewCell
            let dict = mockArray[indexPath.row]
            cell.dataLabel.text = dict["data"]
            cell.timeLabel.text = dict["time"]
            cell.amountLabel.text = dict["amout"]
            
            return cell
        }
}

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

    // MARK: - Bar button configurator
extension PaymentViewController
{
    func configureNavLogoutButton()
    {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(empty))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc func empty()
    {
        
    }
}

