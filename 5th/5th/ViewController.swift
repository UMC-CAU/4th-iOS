//
//  ViewController.swift
//  5th
//
//  Created by 정의찬 on 2023/05/13.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let animationView: LottieAnimationView = .init(name: "loading")
        self.view.addSubview(animationView)
        
        animationView.frame = self.view.bounds
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        
        animationView.play()
        animationView.loopMode = .loop
        animationView.animationSpeed = 5
    }


}

