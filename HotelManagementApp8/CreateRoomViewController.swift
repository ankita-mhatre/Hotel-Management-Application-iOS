//
//  CreateRoomViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/7/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit
import CoreData

class CreateRoomViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var lblRoomPrice: UILabel!
    @IBOutlet weak var lblRoomType: UILabel!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var txtRoomPrice: UITextField!
    @IBOutlet weak var txtRoomType: UITextField!
    @IBOutlet weak var txtRoomName: UITextField!
    
  
    
    @IBAction func importImage(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true){
            // after it is complete
        }
    } 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            print("----------------")
            print(image)
            print("----------------")
            myImageView.image = image
            ForCoreDataArrays.photoTemp = UIImagePNGRepresentation(image) as! NSData
        }else{
            // Error
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBackAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion:nil)
    }
    
    @IBAction func createRoom(_ sender: Any) {
        if txtRoomName.text!.isEmpty || txtRoomType.text!.isEmpty || txtRoomPrice.text!.isEmpty{
            self.showValidationAlert(reason: "Please Enter All Details")
        }else {
            print("Before creating room object")
           //
               let rr = Room(context: PersistenceService.context)
            rr.name = txtRoomName.text!
            rr.occupancy = txtRoomType.text!
            rr.price = Double(txtRoomPrice.text!)!
            rr.occupied = false
            rr.photo = ForCoreDataArrays.photoTemp!
            PersistenceService.saveContext()
            ForCoreDataArrays.roomsArray.append(rr)
            self.showValidationAlert(reason: "Room Added Successfully")
            for r in ForCoreDataArrays.roomsArray
            {
                print(r.name)
            }
            txtRoomPrice.text = ""
            txtRoomType.text = ""
            txtRoomName.text = ""
            ForCoreDataArrays.photoTemp = nil
        }
    }
    
    func showValidationAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
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
