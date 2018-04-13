//
//  DisplayCustomerViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/5/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit
import CoreData
var myIndex = 0
class DisplayCustomerViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return ForCoreDataArrays.customerArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! DisplayCustomerTableViewCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.lblRoom.text = ForCoreDataArrays.customerArray[indexPath.row].name
        cell.roomImage.image = UIImage(named: "husky")
        cell.roomImage.layer.cornerRadius = cell.roomImage.frame.height / 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ForCoreDataArrays.selectedCustomer = ForCoreDataArrays.customerArray[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
