//
//  ViewController.swift
//  TableViewTest
//
//  Created by 조주혁 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {
    
    let firstSectionArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"]
    let secondSectionArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]

    let titleArray = ["키보드 모양", "기능"]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.sectionHeaderHeight = 100
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return firstSectionArray.count
        } else {
            return secondSectionArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if indexPath.section == 0 {
            cell.titleLabel.text = firstSectionArray[indexPath.row]
        } else {
            cell.titleLabel.text = secondSectionArray[indexPath.row]
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section]
    }
    
    
    
}
