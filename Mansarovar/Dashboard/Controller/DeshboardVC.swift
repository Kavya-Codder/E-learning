//
//  DeshboardVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 03/12/22.
//

import UIKit

class DeshboardVC: UIViewController {
    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var sliderPageControl: UIPageControl!
    
    @IBOutlet weak var btnEnrollNow: UIButton!
    
    var currentCelIndex = 0
    let sliderImages = ["chemistry", "E-learning", "landing_screen_center", "image2"]
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnEnrollNow.layer.cornerRadius = 10
        btnEnrollNow.clipsToBounds = true
        
//        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(UINib(nibName: SliderImagesCell.identifier, bundle: nil), forCellWithReuseIdentifier: SliderImagesCell.identifier)
        
        //Slider Cell configration
        let sliderLayout = UICollectionViewFlowLayout()
        let cellWidth = (UIScreen.main.bounds.width - 20)
        sliderLayout.itemSize = CGSize(width: cellWidth, height: 175)
        sliderLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 8, right: 10)
        sliderLayout.scrollDirection = .horizontal
        sliderCollectionView.collectionViewLayout = sliderLayout
        
        // Timer
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideTonext), userInfo: nil, repeats: true)
        sliderPageControl.numberOfPages = sliderImages.count
        
    }
    
    @objc func slideTonext() {
        if currentCelIndex < sliderImages.count - 1 {
            currentCelIndex = currentCelIndex + 1
            
        } else {
            currentCelIndex = 0
        }
        sliderPageControl.currentPage = currentCelIndex
        
        sliderCollectionView.scrollToItem(at: IndexPath(item: currentCelIndex, section: 0), at: .right, animated: true)
    }
    

}
extension DeshboardVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: SliderImagesCell.identifier, for: indexPath) as! SliderImagesCell
        cell.sliderImg.image = UIImage(named: sliderImages[indexPath.row])
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
    
        return cell
    }
    
    
}
