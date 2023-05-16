//
//  ViewController.swift
//  7th
//
//  Created by 정의찬 on 2023/05/14.
//

import UIKit

class ViewController: UIViewController {
    
    //유효값 검사
    var vaildString: Bool = false
    var vaildName: Bool = false
    var vaildId: Bool = false
    var vaildPassword: Bool = false
    var vaildEmail: Bool = false
    
    //idTextField
    @IBOutlet weak var inputID: UITextField!
    
    //warning
    //first: idLabel, second: passwordLabel
    @IBOutlet var warningInput: [UILabel]!
    
    //nameTextFiled
    @IBOutlet weak var inputName: UITextField!
    
    //passwordTextFiled
    @IBOutlet weak var inputPassword: UITextField!
    
    //emailTextFiled
    @IBOutlet weak var inputEmail: UITextField!
    
    
    //okButton
    @IBOutlet weak var okButton: UIButton!
    
    //checkId
    @IBOutlet weak var checkId: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hidden
        for i in warningInput{
            i.isHidden = true
        }
        
        inputName.textColor = UIColor.gray
        inputPassword.textColor = UIColor.gray
        inputID.textColor = UIColor.gray
        inputEmail.textColor = UIColor.gray
        
        //okButton
        okButton.layer.cornerRadius = okButton.frame.height/2 + 1.0
        okButton.layer.borderWidth = 1
        okButton.layer.borderColor = UIColor.red.cgColor
        okButton.layer.backgroundColor = UIColor.red.cgColor
        okButton.setTitleColor(UIColor.white, for: .normal)
        okButton.layer.masksToBounds = true
        
        //checkId
        checkId.layer.cornerRadius = checkId.frame.height/3
        checkId.layer.borderWidth = 1
        checkId.layer.borderColor = UIColor.black.cgColor
        checkId.setTitleColor(UIColor.black, for: .normal)
        checkId.layer.masksToBounds = true
        
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
            
            
        }
    }
    
    //nameCheckBegin
    @IBAction func inputNameActionBegin(_ sender: Any) {
        inputName.text = ""
        inputName.textColor = UIColor.black
        
    }
    
    //nameCheckEnd
    @IBAction func inputNameActionENd(_ sender: Any) {
        vaildName = true
    }
    
    
    
    //idWarningActionBegin
    @IBAction func inputTextAction(_ sender: Any) {
        
        warningInput.first?.textColor = UIColor.red
        warningInput.first?.isHidden = false
        inputID.textColor = UIColor.black
        
        if vaildString == false{
            warningInput.first?.text = "아이디를 입력해주세요"
            inputID.text = ""
        }
    }
    
    //idWarningActionEnd
    @IBAction func inputTextActionEnd(_ sender: Any) {
        let inputWord = inputID.text?.lowercased()
        inputID.text = inputWord
        warningInput.first?.text = ""
        
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
                warningInput.first?.isHidden = true
                vaildId = true
            } else{
                warningInput.first?.text = "소문자,숫자,-만 입력 할 수 있습니다."
            }
        default: break
        }
        
    }
    
    //passwordActionBegin
    @IBAction func inputPasswordBegin(_ sender: Any) {
        if vaildPassword == false{
            inputPassword.text = ""
            warningInput[1].text = "비밀번호를 입력해주세요"
        }
        
        warningInput[1].textColor = UIColor.red
        warningInput[1].isHidden = false
        inputPassword.textColor = UIColor.black
        
    }
    
    //passwordActionEnd
    @IBAction func inputPasswordEnd(_ sender: Any) {
        warningInput[1].isHidden = false
        
        let minCnt = 8
        let maxCnt = 16
        let cnt = inputPassword.text!.count
        
        switch cnt{
        case 0:
            warningInput[1].text = "비밀번호를 필수로 입력해주세요"
        case 1..<minCnt:
            warningInput[1].text = "비밀번호는 8글자 이상입니다."
        case minCnt...maxCnt:
            let passwordPattern = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{\#(minCnt),\#(maxCnt)}$"#
            let isValid = (inputPassword.text!.range(of: passwordPattern, options: .regularExpression) != nil)
            if isValid{
                warningInput[1].isHidden = true
                vaildPassword = true
            } else{
                warningInput[1].text = "알파벳,숫자,특수문자를 입력하세요"
            }
        default:
            warningInput[1].text = "비밀번호는 16글자 이하입니다."
        }
            
    }
    //inputAction
    @IBAction func inputEmailBegin(_ sender: Any) {
        if vaildEmail == false{
            inputEmail.text = ""
            warningInput[2].text = "이메일을 입력하세요"
        }
        
        warningInput[2].textColor = UIColor.red
        warningInput[2].isHidden = false
        inputEmail.textColor = UIColor.black
        
    }
    
    @IBAction func inputEmailEnd(_ sender: Any) {
        warningInput[2].isHidden = false
        
        let emailPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
        let isVaildPattern = (inputEmail.text!.range(of: emailPattern, options: .regularExpression) != nil)
        
        if inputEmail.text!.isEmpty{
            warningInput[2].text = "이메일을 입력하세요"
        } else if isVaildPattern{
            warningInput[2].isHidden = true
            vaildEmail = true
        } else{
            warningInput[2].text = "올바르지 않는 이메일 형식입니다."
        }
    }
    
    
    //allAlert
    func allAlert(title: String, message: String){
        let existId = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let check = UIAlertAction(title: "확인", style: .destructive, handler: nil)

        check.setValue(UIColor.red, forKey: "titleTextColor")
        
        existId.addAction(check)
        present(existId, animated: true, completion: nil)
    }
    
    
    //idCheckButton
    @IBAction func checkUserId(_ sender: Any) {
        if let inputIDText = inputID.text, !inputIDText.isEmpty {
            let userInfor = UserDefaults.standard.string(forKey: "UserIdStore")
            if userInfor == inputIDText {
                allAlert(title: "알림", message: "이미 사용중인 계정입니다.")
                warningInput[0].text = "다시 입력해주세요"
            } else{
                vaildString = true
                allAlert(title: "알림", message: "사용 가능한 계정입니다.")
            }
        }
    }

    
    
    @IBAction func finishButton(_ sender: Any) {
        UserDefaults.standard.set(inputID.text, forKey: "UserIdStore")
        UserDefaults.standard.set(inputPassword.text, forKey: "UserPasswordStore")
        
        if vaildId == true && vaildName == true && vaildPassword == true{
            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "vc")
            vcName?.modalTransitionStyle = .coverVertical
            self.present(vcName!, animated: true, completion: nil)
        }else{
            allAlert(title: "알림", message: "다시 입력해주세요")
        }
        
    }
    
    
    
    
}

