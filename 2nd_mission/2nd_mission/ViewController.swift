//
//  ViewController.swift
//  2nd_mission
//
//  Created by 정의찬 on 2023/04/11.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var fourthBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var firstBtn: UIButton!
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.25, green: 0.56, blue: 1.00, alpha: 1.00)
        
        let borderLayer = CAShapeLayer()
        borderLayer.lineWidth = 2.0
        borderLayer.opacity = 0.5
        borderLayer.strokeColor = UIColor.black.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: firstBtn.bounds.height))
        path.addLine(to: CGPoint(x: firstBtn.bounds.width, y: firstBtn.bounds.height))
        borderLayer.path = path.cgPath

        firstBtn.layer.addSublayer(borderLayer)
        
       
        
        
        let borderLayer1 = CAShapeLayer()
        borderLayer1.lineWidth = 2.0
        borderLayer1.opacity = 0.5
        borderLayer1.strokeColor = UIColor.black.cgColor
        borderLayer1.fillColor = UIColor.clear.cgColor
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0, y: secondBtn.bounds.height))
        path1.addLine(to: CGPoint(x: secondBtn.bounds.width, y: secondBtn.bounds.height))
        borderLayer1.path = path1.cgPath
        
        secondBtn.layer.addSublayer(borderLayer1)
        
        let borderLayer2 = CAShapeLayer()
        borderLayer2.lineWidth = 2.0
        borderLayer2.opacity = 0.5
        borderLayer2.strokeColor = UIColor.black.cgColor
        borderLayer2.fillColor = UIColor.clear.cgColor
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: thirdBtn.bounds.height))
        path2.addLine(to: CGPoint(x: thirdBtn.bounds.width, y: thirdBtn.bounds.height))
        borderLayer2.path = path2.cgPath
        
        thirdBtn.layer.addSublayer(borderLayer2)


    }
    
    
    @IBAction func firstDown(_ sender: Any) {
        self.firstBtn.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
    }
    
    @IBAction func firstUp(_ sender: Any) {
        self.firstBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func secondDown(_ sender: Any) {
        self.secondBtn.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
    }
    
    @IBAction func SecondUp(_ sender: Any) {
        self.secondBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func thirdDown(_ sender: Any) {
        self.thirdBtn.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
    }
    
    @IBAction func thirdUp(_ sender: Any) {
        self.thirdBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func fourthDown(_ sender: Any) {
        self.fourthBtn.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
    }
    
    @IBAction func fourthUp(_ sender: Any) {
        self.fourthBtn.backgroundColor = UIColor.white
    }
    
}

