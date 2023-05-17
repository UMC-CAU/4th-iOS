//
//  TableViewCell.swift
//  6th_mission
//
//  Created by 정의찬 on 2023/05/17.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var finishBtn: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.addSubview(startBtn)
        contentView.addSubview(finishBtn)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
