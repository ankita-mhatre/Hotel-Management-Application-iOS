//
//  ApiMainController.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/12/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class ApiMainController: NSObject {
    class Room {
        var room_name: String?
        var room_rate: String?
        var room_bed_type: String?
        var room_number_of_beds: String?
        var room_type: String?
    }
    static var fetchedRoomArray = [Room]()
    static var selectedRoom : Room = Room()
}
