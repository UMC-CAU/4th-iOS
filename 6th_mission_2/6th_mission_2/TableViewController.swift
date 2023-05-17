//
//  TableViewController.swift
//  6th_mission_2
//
//  Created by 정의찬 on 2023/05/17.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var myTable: UITableView!
    var imgs = ["1.jpeg","2.png","3.png","4.jpeg","5.jpeg","6.png","7.jpeg","8.jpeg"]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let refreshControl =  UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

        myTable.refreshControl = refreshControl
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc private func refreshData(_ sender: UIRefreshControl){
        sender.beginRefreshing() // Start showing the spinner

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Add a delay of 2 seconds
            print(Thread.current)
            self.newImage { newImages in
                self.imgs = newImages

                DispatchQueue.main.async {
                    self.myTable.reloadData()
                    sender.endRefreshing() // Stop showing the spinner
                }
            }
        }
    }
    
    private func newImage(completion: @escaping ([String]) -> Void) {
        let newImages = ["9.jpeg","10.jpeg", "11.jpeg", "12.jpeg","13.png","14.jpeg",]
        completion(newImages)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imgs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.snowImg.image = UIImage(named: imgs[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
