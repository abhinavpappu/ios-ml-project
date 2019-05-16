//
//  HistoryCell.swift
//  ML Project
//
//  Created by Ugo Dos Reis on 5/16/19.
//  Copyright © 2019 Abhinav Pappu. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
