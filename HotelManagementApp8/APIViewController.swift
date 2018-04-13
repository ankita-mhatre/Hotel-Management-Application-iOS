//
//  APIViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/12/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class APIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func fnBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ApiMainController.fetchedRoomArray.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell")
            as! ApiRoomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        // Configure the cell...
        cell.rLabel.text = ApiMainController.fetchedRoomArray[indexPath.row].room_name
        cell.rImage.image = #imageLiteral(resourceName: "Single-Room")
        cell.rImage.layer.cornerRadius = cell.rImage.frame.height / 2
        cell.rImage.layer.masksToBounds = true
        return cell
    }
    
    @IBOutlet weak var rTableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ApiMainController.selectedRoom = ApiMainController.fetchedRoomArray[indexPath.row]
      //  performSegue(withIdentifier: "segue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
