//
//  NotificationCell.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 11.05.2022.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(_ event: Event) {
        eventNameLabel.text = "User \(event.login) \(event.type) your post"
        postImage.image = UIImage(named: "none")
        getImage(withLink: event.postLink) { image in
            self.postImage.image = image
        } onError: { message in
            print(message)
        }
    }
    
}
