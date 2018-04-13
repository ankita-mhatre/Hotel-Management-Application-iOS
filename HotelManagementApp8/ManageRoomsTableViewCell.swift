//
//  ManageRoomsTableViewCell.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/6/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class ManageRoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRoom: UILabel!
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
