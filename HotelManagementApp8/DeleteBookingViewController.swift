//
//  DeleteBookingViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/9/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit
import CoreData

class DeleteBookingViewController: UIViewController {

    @IBOutlet weak var btnDelete: UIButton!
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
       
    }
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var txtBDN: UITextField!
    @IBOutlet weak var lblBND: UILabel!
    @IBOutlet weak var lblDeleteHead: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtBDN.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DelButtonAction(_ sender: UIButton) {
        
        
        if txtBDN.text!.isEmpty {
            self.showValidationAlert(reason: "Please Enter Booking Name First")
        }else if ifbookingExistAndDelete(bkEntered: txtBDN.text!) {
            self.showValidationAlert(reason: "Record Deleted")
        }else {
            self.showValidationAlert(reason: "This Booking Does Not Exists!")
        }
        
    }
    
    func showValidationAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func ifbookingExistAndDelete (bkEntered: String) -> Bool
    {
        var check:Bool = false
        for bk in ForCoreDataArrays.bookingLog
        {
            if bk.name == bkEntered{
                check = true
                PersistenceService.context.delete(bk)
                PersistenceService.saveContext()
                self.showValidationAlert(reason: "Record Deleted")
            }
        }
        if check{
            return true
        }else {
            return false
        }
        
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
