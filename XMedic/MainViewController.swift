//
//  MainViewController.swift
//  XMedic
//
//  Created by Brand on 20/11/1439 AH.
//  Copyright © 1439 Brand. All rights reserved.
//

import UIKit
import Fakery
import Kingfisher

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    let fake = Faker()

    let images = ["1","2","3","4","5","6","7","8","9","10"]
    let names = ["Soror","Majed","Sara","Ali","Mustafa","Mohammed" ,"Hosny", "Asma", "Khalid","Saeed"]
    let green = UIColor.green
    let red = UIColor.red
    let orange = UIColor.orange

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 190
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        cell.name.text = names[indexPath.row]
        cell.avatar.image = UIImage(named: images[indexPath.row])
        
        if indexPath.row == 2 {
            cell.lamp.backgroundColor = green
        }
        if indexPath.row == 3 {
            cell.lamp.backgroundColor = orange
        }
        
        cell.avatar.layer.cornerRadius = cell.avatar.bounds.size.height / 2
        cell.lamp.layer.cornerRadius = cell.lamp.bounds.size.height / 2
        cell.Detail.layer.borderWidth = 2
        cell.Detail.layer.borderColor = UIColor(red:0.55, green:0.59, blue:1.00, alpha:0.6).cgColor
        cell.Detail.layer.cornerRadius = cell.Detail.bounds.height / 2
        cell.card.layer.cornerRadius = 16
        cell.card.layer.shadowColor = UIColor(red:0.55, green:0.59, blue:1.00, alpha:1.0).cgColor
        cell.card.layer.shadowOpacity = 0.3
        cell.card.layer.shadowOffset = CGSize.zero
        cell.card.layer.shadowRadius = 10
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

class TableViewCell: UITableViewCell {
    
    @IBOutlet var lamp: UIView!
    @IBOutlet var card: UIView!
    @IBOutlet var Detail: UIButton!
    @IBOutlet var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
}
