//
//  ViewController.swift
//  DelegateMethodSample
//
//  Created by Tyson Cath on 23/10/18.
//  Copyright © 2018 Tyson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cellCount = 5
    var belowCells: [Int] = []
    var aboveCells: [Int] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let delegateCell = tableView.dequeueReusableCell(withIdentifier: "DelegateCell") as? DelegateTableViewCell {
            delegateCell.titleLabel.text = "Current cell \(indexPath.row)"
            delegateCell.titleLabel.textColor = UIColor.black
            if aboveCells.contains(indexPath.row) {
                delegateCell.titleLabel.text = "Cell inserted above \(indexPath.row)"
                delegateCell.titleLabel.textColor = UIColor.red
            } else if belowCells.contains(indexPath.row) {
                delegateCell.titleLabel.text = "Cell inserted below \(indexPath.row)"
                delegateCell.titleLabel.textColor = UIColor.blue
            }
            delegateCell.delegate = self
            return delegateCell
        }
        return .init()
    }
    
    func reloadSection(indexPath: IndexPath) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
    }
}

extension ViewController: DelegateTableViewCellDelegate {
    func belowAction(cell: DelegateTableViewCell) {
        if let indexPath = self.tableView.indexPath(for: cell) {
            belowCells.append(indexPath.row)
            cellCount += 1
            reloadSection(indexPath: indexPath)
        }
    }
    
    func aboveAction(cell: DelegateTableViewCell) {
        if let indexPath = self.tableView.indexPath(for: cell) {
            aboveCells.append(indexPath.row)
            cellCount += 1
            reloadSection(indexPath: indexPath)
        }
    }
}
