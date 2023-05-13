//
//  AddViewController.swift
//  4th_mission
//
//  Created by 정의찬 on 2023/05/13.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var addItemLb: UITextField!
    
    var tableViewController: TableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: Any) {
        tableViewController?.items.append(addItemLb.text!)
        tableViewController?.itemsImg.append("four.png")
        addItemLb.text = ""
        _ = navigationController?.popViewController(animated: true)
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
