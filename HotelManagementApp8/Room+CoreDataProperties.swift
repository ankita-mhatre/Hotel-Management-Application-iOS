//
//  Room+CoreDataProperties.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/12/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//
//

import Foundation
import CoreData


extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }
    @NSManaged public var name: String
    @NSManaged public var occupancy: String
    @NSManaged public var occupied: Bool
    @NSManaged public var price: Double
    @NSManaged public var photo: NSData
}
