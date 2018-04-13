//
//  Booking+CoreDataProperties.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 3/30/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//
//

import Foundation
import CoreData


extension Booking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Booking> {
        return NSFetchRequest<Booking>(entityName: "Booking")
    }

    @NSManaged public var name: String
    @NSManaged public var fromDate: Date
    @NSManaged public var toDate: Date
    @NSManaged public var customer: Customer
    @NSManaged public var room: Room

}
