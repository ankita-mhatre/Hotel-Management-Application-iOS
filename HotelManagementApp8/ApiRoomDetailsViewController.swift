//
//  ApiRoomDetailsViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/13/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class ApiRoomDetailsViewController: UIViewController {

    @IBAction func backAction(_ sender: UIBarButtonItem) {
        
    }
    
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var lblRoomPrice: UILabel!
    @IBOutlet weak var lblRoomType: UILabel!
    @IBOutlet weak var txtRoomName: UILabel!
    @IBOutlet weak var txtRoomType: UILabel!
    @IBOutlet weak var txtRoomPrice: UILabel!
    @IBOutlet weak var lblBedType: UILabel!
    @IBOutlet weak var txtBedType: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtRoomName.text = ApiMainController.selectedRoom.room_name
        txtRoomType.text = ApiMainController.selectedRoom.room_type
        txtRoomPrice.text = ApiMainController.selectedRoom.room_rate
        txtBedType.text = ApiMainController.selectedRoom.room_bed_type
        
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
