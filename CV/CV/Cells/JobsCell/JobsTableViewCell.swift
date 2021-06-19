//
//  JobsTableViewCell.swift
//  CV
//
//  Created by Daniel Yamrak on 11.06.2021.
//

import UIKit

class JobsTableViewCell: UITableViewCell {

    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with job: Job) {
        yearsLabel.text = job.years
        titleLabel.text = job.title
        descrLabel.text = job.descr
    }
    
}
