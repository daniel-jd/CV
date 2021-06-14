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
    private let topCell = "TopCell"
    private let sectionCell = "SectionCell"
    private let jobCell = "JobCell"
    let cv = ["top", "section", "jobs", "section", "skills"]
    
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
    }
    
    
}

// MARK: TableViewDelegate & TableViewDataSource

extension CVViewController: UITableViewDelegate {
    
}

extension CVViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cv.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var tableCell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: topCell) as? TopTableViewCell {
                tableView.rowHeight = 270
                tableCell = cell
            }
        case 1, 3:
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
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: jobCell) as? JobsTableViewCell {
                tableView.rowHeight = 150
                tableCell = cell
            }
        default:
            break
        }
        return tableCell
    }
    
    
}
