//
//  ViewController.swift
//  3rd_mission
//
//  Created by 정의찬 on 2023/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentNum : Int = 0
    var previousNum : Int = 0
    var matching = false
    var operationString : String = ""
    
    @IBOutlet weak var displayDigit: UILabel!
    
    
    @IBOutlet var radius: [UIButton]!
    
    @IBOutlet weak var zero: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDigit.text = ""
        self.view.backgroundColor = .black
        
        for i in radius{
            
            i.layer.cornerRadius = i.layer.frame.height/2
            i.layer.masksToBounds = true
        }
        
        zero.layer.cornerRadius = 30
        
        
    }
    
    
    @IBAction func digitBtn(_ sender: UIButton) {
        if matching{
            displayDigit.text = sender.currentTitle!
            currentNum = Int(displayDigit.text!)!
            matching = false
        }else{
            displayDigit.text = displayDigit.text! + sender.currentTitle!
            currentNum = Int(displayDigit.text!)!
        }
    }
    
    
    @IBAction func operationBtn(_ sender: UIButton) {
        if displayDigit.text != "" && sender.currentTitle != "+/-" && sender.currentTitle != "."{
            previousNum = Int(displayDigit.text!)!
            operationString = sender.currentTitle!
            matching = true
        }
        
        if sender.currentTitle == "+/-"{
            currentNum = -currentNum
            displayDigit.text = String(currentNum)
        }
        
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        switch operationString{
        case "+":
            currentNum = previousNum + currentNum
        case "−":
            currentNum = previousNum - currentNum
        case "×":
            currentNum = previousNum * currentNum
        case "%":
            currentNum = Int(Double(previousNum).truncatingRemainder(dividingBy: Double(currentNum)))
        case "÷":
            if currentNum != 0{
                currentNum = previousNum / currentNum
            }
        default:
            return
        }
        matching = true
        displayDigit.text = String(currentNum)
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        displayDigit.text = ""
        currentNum = 0
        previousNum = 0
        operationString = ""
        matching = false
    }

}
