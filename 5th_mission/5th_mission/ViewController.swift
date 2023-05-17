//
//  ViewController.swift
//  5th_mission
//
//  Created by 정의찬 on 2023/05/13.
//

import UIKit
import Lottie


class ViewController: UIViewController {

    @IBOutlet weak var imgRes: UIImageView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBAction func startBtn(_ sender: Any) {
        
            self.imgRes.isHidden = true
            self.animationView.play{ (finished) in
            if finished{
                self.imgRes.isHidden = false
            }
        }
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "알림", message: "잠시만 기다려 주시기 바랍니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func PauseButton(_ sender: Any) {
        animationView.pause()
    }
    
    var animationView = LottieAnimationView()
    
    var imageIndex = 0
    var imgGroup = ["1.png","2.png","3.png","4.png","5.png","6.png","7.png",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     imgRes.isHidden = true
        
        
        imgRes.layer.cornerRadius = imgRes.frame.height/3
        
        animationView = .init(name: "progress")
        animationView.frame = view.bounds
        animationView.animationSpeed = 5.0
        
        view.addSubview(animationView)
        
        view.bringSubviewToFront(imgRes)
        view.bringSubviewToFront(startButton)
        view.bringSubviewToFront(pauseButton)
        
       
      
        
    }
    
 
}
