//
//  BookingFinalViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/9/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class BookingFinalViewController: UIViewController {

    @IBOutlet weak var lblAvailableText: UILabel!

    
    @IBOutlet weak var btnback: UIBarButtonItem!
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        
    }
    
    @IBOutlet weak var txtBookingName: UITextField!
    @IBOutlet weak var lblBookingName: UILabel!
    @IBOutlet weak var txtCustName: UITextField!
    @IBOutlet weak var lblEnterCustName: UILabel!
    @IBOutlet weak var txtRoomNumber: UITextField!
    @IBOutlet weak var tvViewRooms: UITextView!
    @IBOutlet weak var btnBookRoom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tvViewRooms.text = ""
        tvViewRooms.text = MainBookingController.RoomsToDisplay
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fnBookRoom(_ sender: UIButton) {
        var roomEntered: String = txtRoomNumber.text!
        var rr = Room()
        if ForCoreDataArrays.VRoomExist(Room: roomEntered)
        {
            
            if txtBookingName.text!.isEmpty || txtRoomNumber.text!.isEmpty || txtCustName.text!.isEmpty{
                self.showValidationAlert(reason: "Please Enter All Details")
            }else {
                
                // find room obj
                for r in ForCoreDataArrays.roomsArray
                {
                    if r.name == roomEntered{
                        rr = r
                    }
                }
                print(rr.name)
                
                //find customer obj
                var customerNameEntered = txtCustName.text!
                var cc = Customer()
                
                for cus in ForCoreDataArrays.customerArray
                {
                    if cus.name == customerNameEntered{
                        cc = cus
                    }
                }
                
//set all data and append in booking log
                
                let booking = Booking(context: PersistenceService.context)
                booking.name = txtBookingName.text!
                booking.room = rr
                booking.fromDate = MainBookingController.StoreFromDate
                booking.toDate = MainBookingController.StoreToDate
                booking.customer = cc
                PersistenceService.saveContext()
                ForCoreDataArrays.bookingLog.append(booking)
                
                self.showValidationAlert(reason: "Booking Successful")
                for b in ForCoreDataArrays.bookingLog
                {
                    print(b.name)
                    print("\n")
                }
            }
            
        }else{
            //alert room doest exist
            print("Room Doesn't Exist")
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
