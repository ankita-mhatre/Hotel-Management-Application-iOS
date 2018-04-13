//
//  ApiRoomTableViewCell.swift
//  HotelManagementApp8
//
//  Created by Ankita Vilas Mhatre on 4/13/18.
//  Copyright © 2018 Ankita Mhatre. All rights reserved.
//

import UIKit

class ApiRoomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UITableViewCell!
    
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var rImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
