//
//  ViewController.swift
//  3rd_mission
//
//  Created by 정의찬 on 2023/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLb: UITextField!
    
    @IBOutlet weak var resultOutput: UILabel!
    
    @IBOutlet weak var changeBtn: UIButton!
    
    @IBOutlet weak var outputLb: UILabel!
    
    var asciiVals = [Int]()
    var sum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputLb.text = "write text in english"
        
        inputLb.clearsOnBeginEditing = true
        inputLb.clearButtonMode = .always
        
        changeBtn.setTitle("checkAscii", for: .normal)
        
        outputLb.text = "each ascciiValue"
        
        resultOutput.text = "Sum asciiValue"
        
        
        inputLb.layer.cornerRadius = 10
        changeBtn.layer.cornerRadius = 10
        outputLb.layer.cornerRadius = 10
        resultOutput.layer.cornerRadius = 10
        
        inputLb.layer.borderWidth = 2
        changeBtn.layer.borderWidth = 2
        outputLb.layer.borderWidth = 2
        resultOutput.layer.borderWidth = 2
        
        inputLb.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        outputLb.layer.borderColor = UIColor.blue.cgColor
        resultOutput.layer.borderColor = UIColor.blue.cgColor
    }
    
    
    @IBAction func ChangeTxt(_ sender: Any) {
        
        outputLb.text = ""
        
        guard let inputText = inputLb.text, !inputText.isEmpty else{
            print("write Text")
            return
        }
        
        changeAscii(inputText)
        
        
        DispatchQueue.global().async {
            for num in self.asciiVals{
                if num % 2 == 0{
                    self.sum += num
                }
            }
        }
        
        DispatchQueue.global().async {
            for num in self.asciiVals{
                if num % 2 == 1{
                    self.sum -= num
                }
            }
        }
        
        DispatchQueue.main.async {
            self.outputLb.text = self.asciiVals.map{String($0)}.joined(separator: ", ")
            self.resultOutput.text = String(self.sum)
            self.asciiVals = []
            self.sum = 0
        }
    }
    
    
    func changeAscii(_ text:String){
        for character in text{
            if let asciiVal = character.asciiValue{
                asciiVals.append(Int(asciiVal))
            }
        }
        
    }
}
