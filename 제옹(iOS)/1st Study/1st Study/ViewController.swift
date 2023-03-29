//
//  ViewController.swift
//  1st Study
//
//  Created by 정의찬 on 2023/03/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var TestView: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var snowImage = UIImage(named: "snow.png")
        TestView.image = snowImage
        
    }

    
    
    
    
}

