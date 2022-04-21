//
//  ListCell.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 21.04.2022.
//

import UIKit

class ListCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
