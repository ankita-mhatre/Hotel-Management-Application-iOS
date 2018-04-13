//
//  RoomDetailsViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/7/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit
 
class RoomDetailsViewController: UIViewController {

    @IBAction func Back(_ sender: UIBarButtonItem) {
        txtRoomName.text = ""
        txtRoomPrice.text = ""
        txtRoomType.text = ""
    }
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
    @IBOutlet weak var lblRoomType: UILabel!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var lblRoomPrice: UILabel!
    @IBOutlet weak var txtRoomName: UILabel!
    @IBOutlet weak var txtRoomType: UILabel!
    @IBOutlet weak var txtRoomPrice: UILabel!
    
    @IBOutlet weak var viewRoomImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = ForCoreDataArrays.selectedRoom?.photo as? Data {
           viewRoomImage.image = UIImage(data: data)
        }
        
        txtRoomName.text = ForCoreDataArrays.selectedRoom?.name
        txtRoomPrice.text = String(describing: ForCoreDataArrays.selectedRoom?.price)
        txtRoomType.text = ForCoreDataArrays.selectedRoom?.occupancy
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
