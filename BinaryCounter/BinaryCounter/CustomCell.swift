//
//  CustomCell.swift
//  BinaryCounter
//
//  Created by Song on 1/18/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit
class CustomCell: UITableViewCell{
    @IBOutlet weak var textLabel2: UILabel!
    weak var delegate:CustomCellDelegate?
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        delegate?.CustomCell(from: self, didPressAction: "minus")
    }
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        delegate?.CustomCell(from: self, didPressAction: "plus")
    }
}
