//
//  OptionViewController.swift
//  2nd_mission
//
//  Created by 정의찬 on 2023/04/12.
//

import UIKit

class OptionViewController: UIViewController {

 
    @IBOutlet weak var secondBtn: UIStackView!
    @IBOutlet weak var firstStack: UIStackView!
    @IBOutlet weak var fistBtn: UIButton!
    @IBOutlet weak var ThirdStack: UIStackView!
    
    
    //switchBtn
    
    @IBOutlet weak var firstSwitch: UISwitch!
    @IBOutlet weak var secondSwitch: UISwitch!
    @IBOutlet weak var thirdSwitch: UISwitch!
    @IBOutlet weak var fourthSwitch: UISwitch!
    @IBOutlet weak var fifthSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.25, green: 0.56, blue: 1.00, alpha: 1.00)
        fistBtn.layer.cornerRadius = fistBtn.frame.size.height / 2.0
        firstStack.layer.cornerRadius = 15
        firstStack.layer.masksToBounds = true
        
        secondBtn.layer.cornerRadius = 15
        secondBtn.layer.masksToBounds = true
        
        ThirdStack.layer.cornerRadius = 15
        ThirdStack.layer.masksToBounds = true
        
        
        //switch
        
        
        firstSwitch.onTintColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
        firstSwitch.tintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
        firstSwitch.thumbTintColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        
        secondSwitch.onTintColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
        secondSwitch.tintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
        secondSwitch.thumbTintColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        
        thirdSwitch.onTintColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
        thirdSwitch.tintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
        thirdSwitch.thumbTintColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        
        fourthSwitch.onTintColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
        fourthSwitch.tintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
        fourthSwitch.thumbTintColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        
        fifthSwitch.onTintColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00)
        fifthSwitch.tintColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
        fifthSwitch.thumbTintColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1.00)
        
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
