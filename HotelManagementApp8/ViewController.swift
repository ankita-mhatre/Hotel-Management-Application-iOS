//
//  ViewController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 3/25/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fetchRequest: NSFetchRequest<Customer> = Customer.fetchRequest()
        print("here")
        do {
            let customer = try PersistenceService.context.fetch(fetchRequest)
            ForCoreDataArrays.customerArray = customer
            for c in ForCoreDataArrays.customerArray
            {
                print(c.name)
            }
        }catch {
            
        }
        
        let fetchRequest1: NSFetchRequest<Room> = Room.fetchRequest()
        print("here in room viewDidLoad")
        do {
            let room = try PersistenceService.context.fetch(fetchRequest1)
            ForCoreDataArrays.roomsArray = room
            for r in ForCoreDataArrays.roomsArray
            {
                print(r.name)
            }
        }catch {
            
        }
        
        let fetchRequest3: NSFetchRequest<Booking> = Booking.fetchRequest()
        print("here in room viewDidLoad")
        do {
            let booking = try PersistenceService.context.fetch(fetchRequest3)
            ForCoreDataArrays.bookingLog = booking
            for bk in ForCoreDataArrays.bookingLog
            {
                print(bk.name)
            }
        }catch {
            
        }
        
        fetchData()
    }
    
    func fetchData(){
        let url = "https://api.sandbox.amadeus.com/v1.2/hotels/search-airport?apikey=Jr5spiPEIGPk5Koxe6ABSktVTi4Aq4rV&location=BOS&check_in=2018-06-15&check_out=2018-06-16&max_rate=500&number_of_results=2&all_rooms=true"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {(data, response, error) in
            if error != nil {
                
            }else {
                do{
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                    
                    if let response1 = fetchedData.value(forKey: "results") as? NSArray{
                        for res in response1{
                            if let resDict = res as? NSDictionary {
                                if let name = resDict.value(forKey: "rooms"){
                                    if let response2 = name as? NSArray{
                                        for h in response2
                                        {
                                            var roomArray = ApiMainController.Room()
                                            if let respoDict = h as? NSDictionary{
                                                if let room_type = respoDict.value(forKey: "room_type_code"){
                                                    roomArray.room_name = room_type as! String
                                                }
                                                
                                                if let respo3 = respoDict.value(forKey: "total_amount"){
                                                    if let totalAmountDict = respo3 as? NSDictionary{
                                                        if let amount = totalAmountDict.value(forKey: "amount")
                                                        {
                                                            roomArray.room_rate = amount as! String
                                                        }
                                                    }
                                                }
                                                if let roomInfoTemp = respoDict.value(forKey: "room_type_info"){
                                                    if let roomInfoDict = roomInfoTemp as? NSDictionary{
                                                        if let bed_type = roomInfoDict.value(forKey: "bed_type"){
                                                            
                                                            roomArray.room_bed_type = bed_type as! String
                                                        }
                                                        if let number_of_beds = roomInfoDict.value(forKey: "number_of_beds"){
                                                            
                                                            roomArray.room_number_of_beds = number_of_beds as! String
                                                        }
                                                        if let room_type = roomInfoDict.value(forKey: "room_type"){
                                                            
                                                            roomArray.room_type = room_type as! String
                                                        }
                                                    }
                                                }
                                                
                                            }
                                            ApiMainController.fetchedRoomArray.append(roomArray)
                                        }
                                        
                                        
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                catch {
                    
                }
            }
        }
        
        
        task.resume()

        }
        
    }



