//
//  ViewController.swift
//  5th
//
//  Created by 정의찬 on 2023/05/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var refScroll: UIScrollView!
    var refreshControl: UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        config()
    }
    
    private func config() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refreshControl?.tintColor = UIColor.systemIndigo
        refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing", attributes: [.foregroundColor: UIColor.systemIndigo])
        refScroll.addSubview(refreshControl!)
    }

    @objc func handleRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.refreshControl?.endRefreshing()
        }
    }

}



