//
//  TopTableViewCell.swift
//  CV
//
//  Created by Daniel Yamrak on 11.06.2021.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        //avatarImageView.clipsToBounds = true
    }
    
}
