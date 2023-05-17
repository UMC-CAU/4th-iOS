import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    var timer: Timer?
    var countDownTime: Int?
    var isFirstRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func firstStart(_ sender: Any) {
        countDownTime = Int(timePicker.countDownDuration)
        isFirstRunning = true
        let queueName = DispatchQueue(label: "queueName")
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.countDownTime! -= 1
            
            DispatchQueue.global().async {
                let hour = self.countDownTime! / 3600
                print("시간단위 Thread : \(Thread.current)")
                DispatchQueue.main.async {
                    self.hourLabel.text = "\(hour)시간"
                }
            }
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.countDownTime! -= 1
            
            queueName.async {
                let min = (self.countDownTime! % 3600) / 60
                print("분단위 Thread : \(Thread.current)")
                DispatchQueue.main.async {
                    self.minLabel.text = "\(min)분"
                }
            }
            
                        
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.countDownTime! -= 1
            
            DispatchQueue.main.async {
                let second = (self.countDownTime! % 3600) % 60
                print("초단위 Thread : \(Thread.current)")
                DispatchQueue.main.async {
                    self.secLabel.text = "\(second)초"
                }
            }
            
            
        }

    }
    
    @IBAction func finishButton(_ sender: Any) {
        isFirstRunning = false
        timer?.invalidate()
        Thread.exit()
    }
}
