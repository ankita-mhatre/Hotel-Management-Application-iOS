//
//  BookingDetailsViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/8/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class BookingDetailsViewController: UIViewController {
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        lbltxtBookingName.text = ""
        lbltxtFromDate.text = ""
        lbltxtToDate.text = ""
        lbltxtCustomerName.text = ""
    }
    
    
    @IBOutlet weak var lblBookingName: UILabel!
    @IBOutlet weak var lblFromDate: UILabel!
    @IBOutlet weak var lblToDate: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    
    @IBOutlet weak var lbltxtBookingName: UILabel!
    @IBOutlet weak var lbltxtToDate: UILabel!
    @IBOutlet weak var lbltxtCustomerName: UILabel!
    @IBOutlet weak var lbltxtFromDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   lbltxtBookingName.text = ForCoreDataArrays.selectedBooking?.name
   lbltxtToDate.text  = String(describing: ForCoreDataArrays.selectedBooking?.toDate)
    lbltxtFromDate.text = String(describing: ForCoreDataArrays.selectedBooking?.fromDate)
        lbltxtCustomerName.text = ForCoreDataArrays.selectedBooking?.customer.name
        // Do any additional setup after loading the view.
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
