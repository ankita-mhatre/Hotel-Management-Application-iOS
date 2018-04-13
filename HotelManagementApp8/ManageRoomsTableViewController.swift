//
//  ManageRoomsTableViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/6/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit
import CoreData

class ManageRoomsTableViewController: UITableViewController {
    let searchController = UISearchController(searchResultsController: nil)
    var filteredRooms = [Room]()
    @IBOutlet var roomsTableView: UITableView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Rooms"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredRooms = ForCoreDataArrays.roomsArray.filter({( room : Room) -> Bool in
            return (room.name.lowercased().contains(searchText.lowercased()))
        })
        
        tableView.reloadData()
    }

    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        print("-----------count 1----------")
//        print(ForCoreDataArrays.roomsArray.count)
//       return ForCoreDataArrays.roomsArray.count
//    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isFiltering()){
            return filteredRooms.count
        }
        print("-----------count 2----------")
        print(ForCoreDataArrays.roomsArray.count)
        return ForCoreDataArrays.roomsArray.count
        
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
//        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell") as! ManageRoomsTableViewCell
//        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
//         cell.roomImage.image = UIImage(named: "Single-Room")
//        cell.lblRoom.text = ForCoreDataArrays.roomsArray[indexPath.row].name
//          cell.roomImage.layer.cornerRadius = cell.roomImage.frame.height / 2
//        return cell
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell") as! ManageRoomsTableViewCell
        let room: Room
        if(isFiltering()){
            room = filteredRooms[indexPath.row]
        } else {
            room = ForCoreDataArrays.roomsArray[indexPath.row]
        }
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.lblRoom.text = room.name
        
        if let data = room.photo as? Data {
            cell.roomImage.image = UIImage(data: data)
        }else {
            cell.roomImage.image = UIImage(named: "Single-Room")
        }

        cell.roomImage.layer.cornerRadius = cell.roomImage.frame.height / 2
        cell.roomImage.layer.masksToBounds = true
        
        // Configure the cell...
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ForCoreDataArrays.selectedRoom = ForCoreDataArrays.roomsArray[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
    extension ManageRoomsTableViewController: UISearchResultsUpdating {
        // MARK: - UISearchResultsUpdating Delegate
        func updateSearchResults(for searchController: UISearchController) {
            filterContentForSearchText(searchController.searchBar.text!)
        }

}
