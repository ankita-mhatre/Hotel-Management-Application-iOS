//
//  BookingTableViewCell.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/8/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCellText: UILabel!
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
