//
//  MyTableCell.swift
//  Student
//
//  Created by Boon on 17/07/19.
//  Copyright © 2019 Boon. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSection: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelPh: UILabel!
    
    //git test
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
