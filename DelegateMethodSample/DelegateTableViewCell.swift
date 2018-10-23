//
//  DelegateTableViewCell.swift
//  DelegateMethodSample
//
//  Created by Tyson Cath on 23/10/18.
//  Copyright © 2018 Tyson. All rights reserved.
//

import UIKit

protocol DelegateTableViewCellDelegate: class {
    func belowAction(cell: DelegateTableViewCell)
    func aboveAction(cell: DelegateTableViewCell)
}

class DelegateTableViewCell: UITableViewCell {
    weak var delegate: DelegateTableViewCellDelegate? = nil
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func belowAction(_ sender: UIButton) {
        delegate?.belowAction(cell: self)
    }
    @IBAction func aboveAction(_ sender: UIButton) {
        delegate?.aboveAction(cell: self)
    }
}
