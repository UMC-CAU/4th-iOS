//
//  GridCollectionViewCell.swift
//  4th
//
//  Created by 정의찬 on 2023/05/03.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var snowLabel: UILabel!
    
    override var isSelected: Bool{
        didSet{
            if isSelected == true{
                image.isHidden = true
                snowLabel.isHidden = true
            }else{
                image.isHidden = false
                snowLabel.isHidden = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
