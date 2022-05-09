//
//  SettingsCell.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.04.2022.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    @IBOutlet weak var subsettingsImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func editData(image: UIImage, name: String) {
        subsettingsImage.image = image
        self.name.text = name
        backgroundColor = .clear
    }
    
}
