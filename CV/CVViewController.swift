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
    private let topCell = "TopCell"
    private let sectionCell = "SectionCell"
    private let jobCell = "JobCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    private func registerTableViewCells() {
        tableView.register(UINib(nibName: topCellNibName, bundle: nil), forCellReuseIdentifier: topCell)
        tableView.register(UINib(nibName: topCellNibName, bundle: nil), forCellReuseIdentifier: sectionCell)
        tableView.register(UINib(nibName: topCellNibName, bundle: nil), forCellReuseIdentifier: jobCell)
    }


}

// MARK: TableViewDelegate & TableViewDataSource

extension CVViewController: UITableViewDelegate {
    
}

extension CVViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: topCell) as? TopTableViewCell {
            // configure
            tableView.rowHeight = 270
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
