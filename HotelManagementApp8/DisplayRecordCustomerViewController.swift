//
//  DisplayRecordCustomerViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/5/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class DisplayRecordCustomerViewController: UIViewController {

    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblCustomerPhone: UILabel!
    @IBOutlet weak var lblCustomerAddress: UILabel!
    
    @IBOutlet weak var lblcname: UILabel!
    @IBOutlet weak var lblcaddress: UILabel!
    @IBOutlet weak var lblcid: UILabel!
    @IBOutlet weak var lblcphone: UILabel!
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        lblcname.text = ""
        lblcaddress.text = ""
        lblcphone.text = ""
        lblcphone.text = ""
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblcname.text = ForCoreDataArrays.selectedCustomer?.name
        lblcaddress.text = ForCoreDataArrays.selectedCustomer?.address
        lblcid.text = ForCoreDataArrays.selectedCustomer?.id
        lblcphone.text = ForCoreDataArrays.selectedCustomer?.phone
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
