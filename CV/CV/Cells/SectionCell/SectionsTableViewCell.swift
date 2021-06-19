//
//  SectionsTableViewCell.swift
//  CV
//
//  Created by Daniel Yamrak on 11.06.2021.
//

import UIKit

class SectionsTableViewCell: UITableViewCell {

//    enum SectionType {
//        case job
//        case skill
//    }
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var sectionImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
