import UIKit

class ViewController: UIViewController {

    var timePickerData: [String] = []
    @IBOutlet weak var saveTable: UITableView!
    
    var alarmData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePickerData = UserDefaults.standard.array(forKey:"time") as? [String] ?? []
        saveTable.delegate = self
        saveTable.dataSource = self
        
        
    }

    @IBAction func saveBtn(_ sender: UIButton) {
        guard let alarmData = alarmData else { return }
        timePickerData.append(alarmData)
        self.saveTable.reloadData()
        UserDefaults.standard.set(timePickerData, forKey: "time")
        
        
    }
    @IBAction func resetBtn(_ sender: UIButton) {
        timePickerData.removeAll()
        self.saveTable.reloadData()
        
    }
    
    @IBAction func timePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd(E요일) a hh:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        alarmData = formatter.string(from: sender.date)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timePickerData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmTableViewCell", for: indexPath) as! alarmTableViewCell
        cell.dateLabel.text = timePickerData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

