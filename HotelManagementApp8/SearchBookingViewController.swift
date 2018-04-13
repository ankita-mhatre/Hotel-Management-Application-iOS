//
//  SearchBookingViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/9/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class SearchBookingViewController: UIViewController {

    @IBAction func BackBtnAction(_ sender: UIBarButtonItem) {
           MainBookingController.StoreSearchResults = ""
           tvSearchResults.text = ""
    }
    @IBOutlet weak var btnSearchByName: UIButton!

    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var btnSearchByDate: UIButton!
    @IBOutlet weak var lblSBHead: UILabel!
    
    @IBOutlet weak var txtUserInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ActionByCustomerName(_ sender: UIButton) {
        var tempAns: String = ""
        
        if !txtUserInput.text!.isEmpty{
            tempAns = ForCoreDataArrays.searchByCustomerName(GivenName: txtUserInput.text!)
            if tempAns == "" {
                self.showValidationAlert(reason: "This Customer Does not Exists")
            }else {
            //    MainBookingController.StoreSearchResults = tempAns
                tvSearchResults.text = tempAns
            }
            
            //  tempAns = MainBookingController.searchByCustomerName(GivenName: txtUserInput.text!)
            
        }else {
            self.showValidationAlert(reason: "Please Enter Customer Name")
        }
        
        
    }
    
    @IBAction func ActionByDate(_ sender: UIButton) {
        var tempAns: String = ""
        if !txtUserInput.text!.isEmpty{
            tempAns = ForCoreDataArrays.searchByDate(GivenDate1: txtUserInput.text!)
            if tempAns == "" {
                self.showValidationAlert(reason: "This Customer Does not Exists")
            }else {
              //  MainBookingController.StoreSearchResults = tempAns
                 tvSearchResults.text = tempAns
            }
            
        }else {
            self.showValidationAlert(reason: "Please Enter Booking Date")
        }
    }
    
    func showValidationAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tvSearchResults: UITextView!
    @IBOutlet weak var lblResultHead: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
