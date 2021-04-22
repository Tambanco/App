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
    
    // MARK: - Outlets
    @IBOutlet weak var tblUsers: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "PaymentViewCell", bundle: nil)
        self.tblUsers.register(nib, forCellReuseIdentifier: "PaymentViewCell")
    
        tblUsers.estimatedRowHeight = 80
        tblUsers.rowHeight = UITableView.automaticDimension
        
        configureLogout()
    }
    
    // MARK: - UITableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return paymentList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentViewCell", for: indexPath) as! PaymentViewCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        cell.initialize(paymentList[indexPath.row])
        cell.dataLabel.preferredMaxLayoutWidth = tblUsers.bounds.width
        cell.timeLabel.preferredMaxLayoutWidth = tblUsers.bounds.width
        cell.paymentLabel.preferredMaxLayoutWidth = tblUsers.bounds.width
        cell.amountLabel.preferredMaxLayoutWidth = tblUsers.bounds.width
        cell.currencyLabel.preferredMaxLayoutWidth = tblUsers.bounds.width
        
        return cell
    }
}

    // MARK: - Logout button configurator
extension PaymentViewController
{
    func configureLogout()
    {
        let heightOfView = view.frame.height
        let widthOfView = view.frame.width
        let heightOfElement: CGFloat = 50.0
        let widthOfElement: CGFloat = widthOfView - 40.0
        let cornerRadius: CGFloat = 10
        
        let loginButton = UIButton(frame: CGRect(x: 20, y: heightOfView * 0.85, width: widthOfElement, height: heightOfElement))
            loginButton.setTitle("Logout", for: .normal)
            loginButton.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.631372549, blue: 0.537254902, alpha: 1)
            loginButton.layer.cornerRadius = cornerRadius
            loginButton.layer.shadowOpacity = 1
            loginButton.layer.shadowRadius = 4.0
            loginButton.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            loginButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)

        self.view.addSubview(loginButton)
    }
    
    @objc func buttonAction(sender: UIButton!)
    {

        let authVC = storyboard?.instantiateViewController(identifier: "AuthViewController") as! AuthViewController
        authVC.modalPresentationStyle = .fullScreen
        present(authVC, animated: true, completion: nil)
    }
}
