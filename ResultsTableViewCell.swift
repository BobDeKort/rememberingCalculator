//
//  ResultsTableViewCell.swift
//  rememberingCalculator
//
//  Created by Bob De Kort on 11/21/16.
//  Copyright © 2016 Bob De Kort. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var calculationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
