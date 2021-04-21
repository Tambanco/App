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
    var paymentList: [Payments] = []
    var list: String = ""
    
    // MARK: - Outlets
    @IBOutlet weak var tblUsers: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "PaymentViewCell", bundle: nil)
        self.tblUsers.register(nib, forCellReuseIdentifier: "PaymentViewCell")
        
        let paymentsArray = list
        print(paymentsArray)
        configureNavBar()
        configureNavLogoutButton()
    }
    
    // MARK: - UITableView delegate
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return paymentList.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            return 70
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentViewCell", for: indexPath) as! PaymentViewCell
            cell.initialize(paymentList[indexPath.row])
            
            return cell
        }
}

   

    // MARK: - Bar button configurator
extension PaymentViewController
{
    func configureNavLogoutButton()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(empty))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc func empty()
    {
        
    }
}

