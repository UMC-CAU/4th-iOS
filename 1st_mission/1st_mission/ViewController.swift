//
//  ViewController.swift
//  1st_mission
//
//  Created by 정의찬 on 2023/04/03.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let title2 = ["에어팟 2년씀 팜","Apple 로고 스티커 1개 남음","호신용 책 필기안함(새책)","작은 물병 팔아요","귀여운 고양이 키울 분~!","초고속 충전기 팜",
                  "향기 좋은 꽃 팔아요(화분줌)","로지텍 키보드(새상품)","캐논 미러리스 일반 렌즈", "로지텍 마우스 팜(1년씀)","패드 케이스 팔아요 강아지 귀여움",
                  "여성용 향수 싸게 팜(반 정도 씀)","군인 슬리퍼(냄새 안남)","머니클립 지갑(브랜드 아님)"]
    let imgs = ["air.jpeg","apple.jpeg","book.jpeg","bottle.jpeg","cat.jpeg","charging.jpeg","flower.jpeg","keyboard.jpeg","flower.jpeg",
                "lens.jpeg", "mouse.jpeg","padCase.jpeg","slipper.jpeg","wallet.jpeg",]
    let adress1 = ["용인시 수지구 상현1동", "정자동","서울시 서초구","수원시 팔달구 매산동","천천동",
                   "서울시 흑석동","수원시 팔달구","서울시 성북구","노량진동","상도 1동","부산","인천광역시 부평구","서울 종로구 세종로","부산시 해운대구"]
    let coins = ["132,000원","1,242원","50,000원","6,000원","999,999원","15,000원","21,000원","20,000원","420,000원","19,000원",
                "24,000원","10,000원","100,000원","12,300원"]
    
    let font = UIFont.boldSystemFont(ofSize: 20)
    
    
    // 최상단 주소
    @IBOutlet weak var currentAddress: UIBarButtonItem!
    
    // 팝업 버튼 오른쪽 하단
    @IBOutlet weak var popBtn: UIButton!
    
    //tab bar text color
    
    let tabFont = UIColor.orange
    
    @IBOutlet weak var homeText: UITabBarItem!
    @IBOutlet weak var lifeText: UITabBarItem!
    @IBOutlet weak var locationText: UITabBarItem!
    @IBOutlet weak var chatText: UITabBarItem!
    @IBOutlet weak var PersonText: UITabBarItem!
    
    @IBOutlet weak var mainBar: UITabBar!
    // img Radius
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath) as! marketCell
        
        cell.titles.text = title2[indexPath.row]
        cell.addresses.text = adress1[indexPath.row]
        cell.coin.text = coins[indexPath.row]
        cell.images.image = UIImage(named: imgs[indexPath.row])
        
        cell.images.layer.cornerRadius = cell.images.frame.width / 8
        cell.images.clipsToBounds = true
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    

    
    @IBOutlet weak var tableView: UITableView!

    
    @objc func clickBtn(_ sender: UIButton){
        if sender.currentImage == UIImage(systemName: "plus"){
            let xImg = UIImage(systemName: "xmark")
            sender.setImage(xImg, for: .normal)
        } else{
            let xImg = UIImage(systemName: "plus")
            sender.setImage(xImg, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popBtn.backgroundColor = UIColor(red: 1.00, green: 0.33, blue: 0.00, alpha: 1.00)
        popBtn.layer.cornerRadius = popBtn.frame.height / 2
        popBtn.clipsToBounds = true
        popBtn.addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
        
        mainBar.selectedItem = homeText
        currentAddress.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
        homeText.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tabFont], for: .selected)
        lifeText.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tabFont], for: .selected)
        locationText.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tabFont], for: .selected)
        chatText.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tabFont], for: .selected)
        PersonText.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tabFont], for: .selected)
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

