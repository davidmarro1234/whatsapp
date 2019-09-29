//
//  chatCell.swift
//  WhatsApp
//
//  Created by David Marro on 29/09/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit

class chatCell: UITableViewCell {
    
// MARK: - Outlets
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
