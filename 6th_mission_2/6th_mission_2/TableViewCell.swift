//
//  TableViewCell.swift
//  6th_mission_2
//
//  Created by 정의찬 on 2023/05/17.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var snowImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
