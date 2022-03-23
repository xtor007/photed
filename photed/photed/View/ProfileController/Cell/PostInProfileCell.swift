//
//  PostInProfileCell.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 23.03.2022.
//

import UIKit

class PostInProfileCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.contentMode = .scaleAspectFill
        // Initialization code
    }

}
