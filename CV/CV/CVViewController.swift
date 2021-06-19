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
    
    enum SectionType {
        case avatar
        case section(String, UIImage)
        case job(Job)
        case skill
    }
    
    var rowType: [SectionType] = [.avatar]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        
        rowType.append(.section("Job experience:", #imageLiteral(resourceName: "image 1")))
        rowType.append(.job(Job(title: "McDonald's", years: "2010 - 2015", descr: "Waiter")))
        rowType.append(.job(Job(title: "KFC", years: "2015 - 2020", descr: "Top Manager")))
        rowType.append(.job(Job(title: "Apple Inc.", years: "2020 - ...", descr: "CEO")))
        rowType.append(.section("Skills:", #imageLiteral(resourceName: "icon.skills")))
        rowType.append(.skill)
        
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
        return rowType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var tableCell = UITableViewCell()
        let type = rowType[indexPath.row]
        switch type {
        case .avatar:
            if let cell = tableView.dequeueReusableCell(withIdentifier: topCell) as? AvatarTableViewCell {
                tableView.rowHeight = 280
                cell.configure()
                tableCell = cell
            }
        case let .section(title, img):
            if let cell = tableView.dequeueReusableCell(withIdentifier: sectionCell) as? SectionsTableViewCell {
                tableView.rowHeight = 86
                cell.sectionLabel?.text = title
                cell.sectionImage?.image = img
                tableCell = cell
            }
        case let .job(jobItem):
            if let cell = tableView.dequeueReusableCell(withIdentifier: jobCell) as? JobsTableViewCell {
                tableView.rowHeight = 50
                cell.configure(with: jobItem)
                tableCell = cell
            }
        case let .section(title, img):
            if let cell = tableView.dequeueReusableCell(withIdentifier: sectionCell) as? SectionsTableViewCell {
                tableView.rowHeight = 86
                cell.sectionLabel?.text = title
                cell.sectionImage?.image = img
                tableCell = cell
            }
        case .skill:
            if let cell = tableView.dequeueReusableCell(withIdentifier: skillsCell) as? SkillsTableViewCell {
                tableView.rowHeight = 90
                tableCell = cell
            }
        }
        return tableCell
    }
    
    
}
