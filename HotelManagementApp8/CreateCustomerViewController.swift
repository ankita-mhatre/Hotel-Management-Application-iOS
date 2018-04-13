//
//  CreateCustomerViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/5/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit
import CoreData
class CreateCustomerViewController: UIViewController {

    @IBOutlet weak var txtCID: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtCAddress: UITextField!
    @IBOutlet weak var txtCustomerName: UITextField!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
     
    @IBAction func btnBackAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func AddCustomer(_ sender: UIButton) {
        if txtCustomerName.text!.isEmpty || txtCID.text!.isEmpty || txtCAddress.text!.isEmpty || txtPhoneNumber.text!.isEmpty
        {
            self.showValidationAlert(reason: "Please Enter All Details!")
            
        }else if !MainBookingController.VPassport(value: txtCID.text!){
            self.showValidationAlert(reason: "Please Enter Valid Passport Number")
            txtCID.text = ""
            
        }else if !MainBookingController.VPhoneNumber(value: txtPhoneNumber.text!){
            self.showValidationAlert(reason: "Please Enter Valid Phone Number")
            txtPhoneNumber.text = ""
        }else {
            
            let cc = Customer(context: PersistenceService.context)
            cc.address = txtCAddress.text!
            cc.id = txtCID.text!
            cc.name = txtCustomerName.text!
            cc.phone = txtPhoneNumber.text!
            PersistenceService.saveContext()
            ForCoreDataArrays.customerArray.append(cc)
            self.showValidationAlert(reason: "Customer Created")
            
            for c in ForCoreDataArrays.customerArray
            {
                print(c.name)
                print("\n")
            }
            txtCAddress.text = ""
            txtCID.text = ""
            txtPhoneNumber.text = ""
            txtCustomerName.text = ""
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showValidationAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
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
