//
//  ViewController.swift
//  CV
//
//  Created by Daniel Yamrak on 29.05.2021.
//

import UIKit

class CVViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let topCellNibName = "TopTableViewCell"
    private let sectionCellNibName = "SectionsTableViewCell"
    private let jobCellNibName = "JobsTableViewCell"
    private let skillsCellNibName = "SkillsTableViewCell"
    private let topCell = "TopCell"
    private let sectionCell = "SectionCell"
    private let jobCell = "JobCell"
    private let skillsCell = "SkillsTableViewCell"
    
    enum CellType {
        case avatar, jobSection, job, skillSection, skill
    }
    
    let cellType: [CellType] = [.avatar, .jobSection, .job, .skillSection, .skill]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func registerTableViewCells() {
        tableView.register(UINib(nibName: topCellNibName, bundle: nil), forCellReuseIdentifier: topCell)
        tableView.register(UINib(nibName: sectionCellNibName, bundle: nil), forCellReuseIdentifier: sectionCell)
        tableView.register(UINib(nibName: jobCellNibName, bundle: nil), forCellReuseIdentifier: jobCell)
        tableView.register(UINib(nibName: skillsCellNibName, bundle: nil), forCellReuseIdentifier: skillsCell)
    }
    
    
}

// MARK: TableViewDelegate & TableViewDataSource

extension CVViewController: UITableViewDelegate {
    
}

extension CVViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var tableCell = UITableViewCell()
        let type = cellType[indexPath.row]
        switch type {
        case .avatar:
            if let cell = tableView.dequeueReusableCell(withIdentifier: topCell) as? TopTableViewCell {
                tableView.rowHeight = 270
                cell.configure()
                tableCell = cell
            }
        case .jobSection, .skillSection:
            if let cell = tableView.dequeueReusableCell(withIdentifier: sectionCell) as? SectionsTableViewCell {
                if indexPath.row == 1 {
                    cell.type = .job
                    cell.sectionImage.image = cell.secImage
                }
                if indexPath.row == 3 {
                    cell.type = .skill
                    cell.sectionImage.image = cell.secImage
                    cell.sectionLabel.text = cell.secText
                }
                tableView.rowHeight = 86
                tableCell = cell
            }
        case .job:
            if let cell = tableView.dequeueReusableCell(withIdentifier: jobCell) as? JobsTableViewCell {
                tableView.rowHeight = 150
                tableCell = cell
            }
        case .skill:
            if let cell = tableView.dequeueReusableCell(withIdentifier: skillsCell) as? SkillsTableViewCell {
                tableView.rowHeight = 150
                tableCell = cell
            }
        }
        return tableCell
    }
    
    
}
