//
//  SectionsTableViewCell.swift
//  CV
//
//  Created by Daniel Yamrak on 11.06.2021.
//

import UIKit

class SectionsTableViewCell: UITableViewCell {

    enum SectionType {
        case job
        case skill
    }
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var sectionImage: UIImageView!
    
    var secText: String {
        switch self.type {
        case .job:
            return "Job experience"
        case .skill:
            return "Skills"
        default:
            return "Section"
        }
    }
    
    var secImage: UIImage {
        switch self.type {
        case .job:
            return #imageLiteral(resourceName: "image 1")
        case .skill:
            return #imageLiteral(resourceName: "icon.skills")
        default:
            return #imageLiteral(resourceName: "icon.swift")
        }
    }
    
    var type: SectionType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
