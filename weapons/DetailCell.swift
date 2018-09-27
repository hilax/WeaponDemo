//
//  DetailCell.swift
//  weapons
//
//  Created by Hilax on 2018/5/24.
//  Copyright © 2018年 Hilax. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var valueLable: UILabel!
    @IBOutlet weak var fieldLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
