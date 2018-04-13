//
//  MainBookingController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/5/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class MainBookingController: NSObject {
    
    static var RoomsToDisplay : String = ""
    class Customer {
        var name: String
        var id: String
        var address : String
        var phone_number: String
        init()
        {
            self.name=""
            self.id=""
            self.address=""
            self.phone_number=""
        }
    }
    
    class Room{
        var name: String
        var occupancy: String
        var price: Double
        var occupied: Bool  //false for not occupied
        init(){
            self.name=""
            self.occupancy=""
            self.price=0
            self.occupied=false
        }
    }
    
    class Booking{
        var bookingName:String
        var fromDate:Date
        var toDate:Date
        var customer:Customer
        var room:Room
        init(){
            self.bookingName=""
            self.fromDate = Date()
            self.toDate = Date()
            self.customer = Customer()
            self.room = Room()
        }
    }
    
    
    static var customerArray: [Customer] = []
    static var roomArray: [Room] = []
    static var bookingLog: [Booking] = []
    static var StoreSearchResults: String = ""
    static var StoreToDate: Date = Date()
    static var StoreFromDate: Date = Date()
    
    class func createCustomer(name:String, id: String, address: String, tel:String) -> Bool
    {
        let c = Customer()
        c.name = name
        c.address = address
        c.id = id
        c.phone_number = tel
        
        
        
        MainBookingController.customerArray.append(c)
        return true
    }
    
    class func createRoom(name: String,occupancy: String,price: Double)->Bool
    {
        let r = Room()
        r.name = name
        r.occupancy = occupancy
        r.price = price
        
        roomArray.append(r)
        return true
    }
    
    class func booking1(fromDate: Date, toDate: Date)-> String
    {
        var roomsAre: String = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for r in roomArray{
            if r.occupied
            {
                for b in bookingLog{
                    print(r === b.room)
                    if r === b.room
                    {
                        
                        if fromDate != b.fromDate && fromDate != b.toDate && toDate != b.fromDate && fromDate != b.toDate
                        {
                            if toDate < b.fromDate  //booking before existing booking
                            {
                                print(b.room.name)
                                print("In  booking before existing date")
                                roomsAre += "\(b.room.name)"
                                
                            }else if fromDate > b.toDate
                            {
                                print(b.room.name)
                                print("in booking after existing booking")
                                roomsAre += "\(b.room.name)"
                                
                            }
                        }
                    }
                }
            }else
            {
                print("Available rooms are as follows:")
                print(r.name)
                
                roomsAre += "\(r.name)"
            }
            
        }
        return roomsAre
    }
    
    
    class func booking2(BName: String, BCName: String,BRNo: Room, FDate: Date, TDate: Date ) -> Bool{
        let b = Booking()
        b.bookingName = BName
        b.fromDate = FDate
        b.toDate = TDate
        //get customer obj
        for cus in customerArray
        {
            if cus.name == BCName{
                b.customer = cus
            }
        }
        //setting room occupancy as true i.e booked
        b.room.occupied = true
        //setting room obj in b.room
        b.room = BRNo
        BRNo.occupied = true
        bookingLog.append(b)
        return true
    }
    
    class func displayBooking() -> String{
        var tempStringMain: String = ""
        let tempString3: String = "-----------------------------------------------------------------------\n"
        
        let tempString4: String = "| Booking name | Customer Name |Room Number | From | To |\n"
        
        let tempString5 :String = "------------------------------------------------------------------------ \n"
        
        tempStringMain += tempString3
        tempStringMain += tempString4
        tempStringMain += tempString5
        
        for bk  in MainBookingController.bookingLog{
            
            tempStringMain  += "|\(bk.bookingName) |\(bk.customer.name) |\(bk.room.name) |\(bk.fromDate)|\(bk.toDate)| \n "
            
        }
        print(tempStringMain)
        return tempStringMain
    }
    
    class func searchByDate(GivenDate1: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let GivenDate = dateFormatter.date(from: GivenDate1)
        var tempString: String = ""
        for bk in MainBookingController.bookingLog
        {
            if bk.fromDate == GivenDate{
                tempString += "| Name: \(bk.bookingName) | Customer Name: \(bk.customer.name) | Room No: \(bk.room.name) | From Date: \(bk.fromDate)| To Date: \(bk.toDate) | \n"
            }
        }
        return tempString
    }
    
    class func searchByCustomerName(GivenName: String) -> String{
        var tempString: String = ""
        for bk in MainBookingController.bookingLog
        {
            if bk.customer.name == GivenName{
                tempString += "| Name: \(bk.bookingName) | Customer Name: \(bk.customer.name) | Room No: \(bk.room.name) | From Date: \(bk.fromDate)| To Date: \(bk.toDate)"
            }
        }
        return tempString
    }
    
    class func searchByBookingName(GivenName: String) -> String{
        var tempString: String = ""
        for bk in MainBookingController.bookingLog
        {
            if bk.bookingName == GivenName{
                tempString += "| Name: \(bk.bookingName) | Customer Name: \(bk.customer.name) | Room No: \(bk.room.name) | From Date: \(bk.fromDate)| To Date: \(bk.toDate)|"
                tempString += "\n"
            }
        }
        return tempString
    }
    
    class func deleteRecord(BookingName: String) -> Bool {
        var i: Int = 0
        var found: Bool = false
        for booking in bookingLog{
            
            if(BookingName==booking.bookingName){
                bookingLog.remove(at:i)
                found=true
            }
            i+=1
        }
        return found
    }
    // VALIDATION FUNCTIONS
    
    class func VDateCheck(fromDate: Date, toDate: Date) -> Bool
    {
        if toDate.compare(fromDate) == .orderedAscending
        {
            return true
            
        }else
        {
            return false
        }
    }
    
    class func VRoomExist(Room: String) -> Bool
    {
        for r in roomArray{
            if r.name == Room
            {
                return true
            }
        }
        return false
    }
    
    class func VPhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "[0-9]{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    class func VPassport(value: String) -> Bool {
        let PASS_REGEX = "[A-Z][0-9]{7,10}"
        let passTest = NSPredicate(format: "SELF MATCHES %@", PASS_REGEX)
        let result =  passTest.evaluate(with: value)
        return result
    }
    
    
}
