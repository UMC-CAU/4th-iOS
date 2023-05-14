//
//  ViewController.swift
//  7th
//
//  Created by 정의찬 on 2023/05/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //idTextField
    @IBOutlet weak var inputID: UITextField!
    
    //warning
    //first: idLabel, second: passwordLabel
    @IBOutlet var warningInput: [UILabel]!
    
    //passwordTextFiled
    @IBOutlet weak var inputPassword: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hidden
        for i in warningInput{
            i.isHidden = true
        }
    }
    
    //idWarningActionBegin
    @IBAction func inputTextAction(_ sender: Any) {
        inputID.text = ""
        warningInput.first?.text = "아이디를 입력해주세요"
        warningInput.first?.textColor = UIColor.red
        warningInput.first?.isHidden = false
    }
    
    //idWarningActionEnd
    @IBAction func inputTextActionEnd(_ sender: Any) {
        let inputWord = inputID.text?.lowercased()
        inputID.text = inputWord
        
        let minCnt = 5
        let maxCnt = 12
        let cnt = inputWord!.count
        
        switch cnt{
        case 0:
            warningInput.first?.text = "아이디를 필수로 입력해주세요"
        case 1..<minCnt:
            warningInput.first?.text = "5글자 이상 작성해주세요"
        case minCnt...maxCnt:
            let idPattern = "^[a-z0-9-_]{\(minCnt),\(maxCnt)}$"
            let validPattern = (inputWord!.range(of: idPattern, options: .regularExpression) != nil )
            if validPattern {
                warningInput.first?.text = "알맞게 입력했습니다"
                warningInput.first?.isHidden = true
            } else{
                warningInput.first?.text = "소문자,숫자,-만 입력 할 수 있습니다."
            }
        default:
            warningInput.first?.text = "아이디 12글자 이하로 작성하세요"
        }
        
    }
    
    //passwordActionBegin
    @IBAction func inputPasswordBegin(_ sender: Any) {
        inputPassword.text = ""
        warningInput.last?.text = "비밀번호를 입력해주세요"
        warningInput.last?.textColor = UIColor.red
        warningInput.last?.isHidden = false
        
    }
    
    //passwordActionEnd
    @IBAction func inputPasswordEnd(_ sender: Any) {
        warningInput.last?.isHidden = false
        
        let minCnt = 8
        let maxCnt = 16
        let cnt = inputPassword.text!.count
        
        switch cnt{
        case 0:
            warningInput.last?.text = "비밀번호를 필수로 입력해주세요"
        case 1..<minCnt:
            warningInput.last?.text = "비밀번호는 8글자 이상입니다."
        case minCnt...maxCnt:
            let passwordPattern = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{\#(minCnt),\#(maxCnt)}$"#
            let isValid = (inputPassword.text!.range(of: passwordPattern, options: .regularExpression) != nil)
            if isValid{
                warningInput.last?.text = "알맞게 입력했습니다"
                warningInput.last?.isHidden = true
            } else{
                warningInput.last?.text = "알파벳,숫자,특수문자를 입력하세요"
            }
        default:
            warningInput.last?.text = "비밀번호는 16글자 이하입니다."
        }
            
    }
    
}
