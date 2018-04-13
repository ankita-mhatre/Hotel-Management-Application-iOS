//
//  Customer+CoreDataProperties.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 3/30/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var address: String
    @NSManaged public var id: String
    @NSManaged public var phone: String
    @NSManaged public var name: String

}
