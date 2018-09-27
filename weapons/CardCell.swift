//
//  CardCell.swift
//  weapons
//
//  Created by Hilax on 2018/5/22.
//  Copyright © 2018年 Hilax. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var originLable: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var weaponLable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    //观察者模式
    var favorite = false{
        //预判断
        willSet{
            if newValue {
                favBtn.setImage(#imageLiteral(resourceName: "fav") ,for: .normal)
            }else{
                favBtn.setImage(#imageLiteral(resourceName: "unfav") ,for: .normal)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
