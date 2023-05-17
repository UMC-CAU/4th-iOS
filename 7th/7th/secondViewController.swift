//
//  secondViewController.swift
//  7th
//
//  Created by 정의찬 on 2023/05/16.
//

import UIKit

class secondViewController: UIViewController {
    
    //inputLoginId
    @IBOutlet weak var loginId: UITextField!
    
    //inputLoginPassword
    @IBOutlet weak var loginPassword: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var makeId: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginId.text = "아이디"
        loginPassword.text = "비밀번호"
        
        loginId.textColor = UIColor.gray
        loginPassword.textColor = UIColor.gray
        
        loginButton.layer.cornerRadius = loginButton.frame.height / 3 + 1.0
        loginButton.layer.borderWidth = 1
        loginButton.setTitleColor(UIColor.black, for: .normal)
        
        makeId.layer.cornerRadius = makeId.frame.height/3 + 1.0
        makeId.layer.borderWidth = 1
        makeId.layer.borderColor = UIColor.black.cgColor
        makeId.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    
    func loginAlert(title: String, message: String){
        let login = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let checkLogin = UIAlertAction(title: "ok", style: .default)
        
        login.addAction(checkLogin)
        present(login, animated: true, completion: nil)
    }
    
    
    @IBAction func IdAction(_ sender: Any) {
        loginId.text = ""
        loginId.textColor = UIColor.black
    }
    
    @IBAction func PasswordAction(_ sender: Any) {
        loginPassword.text = ""
        loginPassword.textColor = UIColor.black
    }
    
    
    
    
    
    @IBAction func login(_ sender: Any) {
        
        let userId = UserDefaults.standard.string(forKey: "UserIdStore")
        let userPassword = UserDefaults.standard.string(forKey: "UserPasswordStore")
        
        if loginId.text != userId || loginPassword.text != userPassword{
            loginAlert(title: "알림", message: "아이디/비번을 다시 입력해주세요")
        } else if loginId.text == userId && loginPassword.text == userPassword  {
            loginAlert(title: "알림", message: "로그인되었습니다.")

            loginId.text = "아이디"
            loginPassword.text = "비밀번호"        }
    }
    
    @IBAction func changeView(_ sender: Any) {
        let viewName = self.storyboard?.instantiateViewController(withIdentifier: "mainView")
        
        viewName?.modalTransitionStyle = .coverVertical
        viewName?.modalPresentationStyle = .fullScreen
        self.present(viewName!, animated: true, completion: nil)
    }
}
