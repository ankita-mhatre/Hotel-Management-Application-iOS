//
//  BookingStep1ViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/9/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class BookingStep1ViewController: UIViewController {

    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var tDatePicker: UIDatePicker!
    @IBOutlet weak var fDatePicker: UIDatePicker!
    @IBOutlet weak var lblSTD: UILabel!
    @IBOutlet weak var lblSFD: UILabel!
    @IBOutlet weak var lblDisplayToDate: UILabel!
    @IBOutlet weak var lblDisplayFromDate: UILabel!
    @IBOutlet weak var btnGetDates: UIButton!
    @IBOutlet weak var btnNextStep: UIButton!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        fDatePicker.minimumDate = date
        tDatePicker.minimumDate = date
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        lblDisplayToDate.text = ""
        lblDisplayFromDate.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fnGetDates(_ sender: UIButton) {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        var tDate = dateFormatter.string(from: tDatePicker.date)
        lblDisplayToDate.text = tDate
        var fDate = dateFormatter.string(from: fDatePicker.date)
        lblDisplayFromDate.text = fDate
    }
    
    @IBAction func fnNextStep(_ sender: UIButton) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        var fromDate: String = lblDisplayFromDate.text!
        let fDate = dateFormatter.date(from: fromDate)
        var toDate: String = lblDisplayToDate.text!
        let tDate = dateFormatter.date(from: toDate)
        
        if (lblDisplayToDate.text?.isEmpty)! || (lblDisplayFromDate.text?.isEmpty)!{
            print("here")
            self.showValidationAlert(reason: "Please Select Dates First!")
            return
        }else if MainBookingController.VDateCheck(fromDate: fDate!, toDate: tDate!){
            self.showValidationAlert(reason: "Invalid Dates!")
            return
        }else{
            // get rooms and set to global string
            MainBookingController.RoomsToDisplay = ForCoreDataArrays.booking1(fromDate: fDate!, toDate: tDate!)
            MainBookingController.StoreToDate = tDate!
            MainBookingController.StoreFromDate = fDate!
            lblDisplayToDate.text = ""
            lblDisplayFromDate.text = ""

        }
        
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
