//
//  ViewController.swift
//  8th
//
//  Created by 정의찬 on 2023/05/26.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var clickCnt = false
    
    let colors:[UIColor] = [.red, .blue, .green, .black, .purple, .orange]
 
    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var aniLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapgesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapgesture.delegate = self
        
        self.view.addGestureRecognizer(tapgesture)
        
        Animation()
        
        clickBtn.backgroundColor = UIColor.red
        clickBtn.layer.cornerRadius = clickBtn.layer.frame.height/2
        clickBtn.tintColor = UIColor.white
        
    }

    
    func Animation(){
        let currentLocation = aniLabel.center
        UIView.animate(withDuration: 5, animations: {
            self.aniLabel.center = CGPoint(x: self.view.frame.width / 2, y: currentLocation.y + self.view.frame.height/2)
        })
    }
    
    @IBAction func aniAction(_ sender: Any) {
        clickCnt = !clickCnt
        UIView.animate(withDuration: 0.2){
            if self.clickCnt{
                self.clickBtn.backgroundColor = UIColor.black
                self.clickBtn.tintColor = UIColor.blue
            }else{
                self.clickBtn.backgroundColor = UIColor.blue
                self.clickBtn.tintColor = UIColor.white
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        let randomColor  = colors[Int.random(in: 0..<colors.count)]
        self.aniLabel.textColor = randomColor
        return true
    }

}
