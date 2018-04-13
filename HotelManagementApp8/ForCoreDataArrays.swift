//
//  ForCoreDataArrays.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/5/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class ForCoreDataArrays: NSObject {
    static var photoTemp: NSData? = nil
    static var customerArray: [Customer] = []
    static var roomsArray: [Room] = []
    static var bookingLog: [Booking] = []
      static var selectedCustomer: Customer? = nil
    static var selectedRoom: Room? = nil
    static var selectedBooking: Booking? = nil
    
    class func booking1(fromDate: Date, toDate: Date)-> String
    {
        var roomsAre: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for r in roomsArray{
            if r.occupied
            {
                for b in bookingLog{
                    print(r === b.room)
                    if r === b.room
                    {
                        
                        if fromDate != b.fromDate as Date && fromDate != b.toDate && toDate != b.fromDate && fromDate != b.toDate
                        {
                            if toDate < b.fromDate  //booking before existing booking
                            {
                                print(b.room.name)
                                print("In  booking before existing date")
                                roomsAre += "\(b.room.name) ,"
                                
                            }else if fromDate > b.toDate
                            {
                                print(b.room.name)
                                print("in booking after existing booking")
                                roomsAre += "\(b.room.name) ,"
                                
                            }
                        }
                    }
                }
            }else
            {
                print("Available rooms are as follows:")
                print(r.name)
                
                roomsAre += "\(r.name) ,"
            }
            
        }
        return roomsAre
    }
    
    
    class func VRoomExist(Room: String) -> Bool
    {
        for r in ForCoreDataArrays.roomsArray{
            if r.name == Room
            {
                return true
            }
        }
        return false
    }
    
    class func searchByDate(GivenDate1: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let GivenDate = dateFormatter.date(from: GivenDate1)
        var tempString: String = ""
        for bk in bookingLog
        {
            if bk.fromDate == GivenDate{
                tempString += "| Name: \(bk.name) | Customer Name: \(bk.customer.name) | Room No: \(bk.room.name) | From Date: \(bk.fromDate)| To Date: \(bk.toDate) | \n"
            }
        }
        return tempString
    }
    
    class func searchByCustomerName(GivenName: String) -> String{
        var tempString: String = ""
        for bk in bookingLog
        {
            if bk.customer.name == GivenName{
                tempString += "| Name: \(bk.name) | Customer Name: \(bk.customer.name) | Room No: \(bk.room.name) | From Date: \(bk.fromDate)| To Date: \(bk.toDate)"
                tempString += "\n"
            }
        }
        return tempString
    }
    
    class func searchByBookingName(GivenName: String) -> String{
        var tempString: String = ""
        for bk in bookingLog
        {
            if bk.name == GivenName{
                tempString += "| Name: \(bk.name) | Customer Name: \(bk.customer.name) | Room No: \(bk.room.name) | From Date: \(bk.fromDate)| To Date: \(bk.toDate)|"
                tempString += "\n"
            }
        }
        return tempString
    }
    
}
