//
//  mainCell.swift
//  businessLoan
//
//  Created by Yazan Altwil on 5/19/17.
//  Copyright © 2017 Yazan Altwil. All rights reserved.
//

import UIKit

class mainCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellLabel2: UILabel!
    @IBOutlet weak var input1: UITextField!
    
    
    func getInputOne() -> Double {
        return Double(input1.text!)!
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
