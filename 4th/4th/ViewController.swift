//
//  ViewController.swift
//  4th
//
//  Created by 정의찬 on 2023/05/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let snowList = snowChar.data
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return snowList.count
        }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        
        let target = snowList[indexPath.row]
        
        let img = UIImage(named: "\(target.image).png")
        cell.image?.image = img
        cell.snowLabel?.text = target.title
        
        return cell
    }
    
  //  var arrImageName: [String] = ["snow.png", "snow1.png","snow2.png","snow3.png","snow4.png","snow5.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

        // CollectionView Cell의 Size
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width: CGFloat = collectionView.frame.width / 2 -  1.0
            
            return CGSize(width: width, height: width)
        }
        
        // CollectionView Cell의 위아래 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 2.0
        }
        
        // CollectionView Cell의 옆 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 2.0
        }
    
    
}

