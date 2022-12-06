//
//  DeshboardVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 03/12/22.
//

import UIKit

class DeshboardVC: UIViewController {
    
   
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var sliderPageControl: UIPageControl!
    
    @IBOutlet weak var subjectsListCollectionView: UICollectionView!
    
    var obj: ExamModel?
    var currentCelIndex = 0
    let cellColours = [""]
    let sliderImages = ["chemistry", "E-learning", "landing_screen_center", "image2"]
    var timer: Timer?
    var deshboardData: [SubjectModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        deshboardApi()
        
       
//        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(UINib(nibName: SliderImagesCell.identifier, bundle: nil), forCellWithReuseIdentifier: SliderImagesCell.identifier)
        
        subjectsListCollectionView.delegate = self
        subjectsListCollectionView.dataSource = self
        subjectsListCollectionView.register(UINib(nibName: DeshboardCell.identifier, bundle: nil), forCellWithReuseIdentifier: DeshboardCell.identifier)
        
        //Slider Cell configration
        let sliderLayout = UICollectionViewFlowLayout()
        let cellWidth = (UIScreen.main.bounds.width - 4)
        sliderLayout.itemSize = CGSize(width: cellWidth, height: 175)
        sliderLayout.sectionInset = UIEdgeInsets(top: 10, left: 2, bottom: 8, right: 2)
        sliderLayout.scrollDirection = .horizontal
        sliderCollectionView.collectionViewLayout = sliderLayout
        
        //Deshboard Cell configration
        let Layout = UICollectionViewFlowLayout()
        let Width = (UIScreen.main.bounds.width - 50)/2
        Layout.itemSize = CGSize(width: Width, height: 170)
        Layout.minimumLineSpacing = 15
        Layout.minimumInteritemSpacing = 15
        Layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        Layout.scrollDirection = .vertical
        subjectsListCollectionView.collectionViewLayout = Layout
        
        
        
        // Timer
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideTonext), userInfo: nil, repeats: true)
        sliderPageControl.numberOfPages = sliderImages.count
        
    }
    override func viewWillAppear(_ animated: Bool) {
        lblTitle.text = obj?.name
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
    
    // table
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView {
            return sliderImages.count
        }else if collectionView == subjectsListCollectionView {
            return deshboardData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: SliderImagesCell.identifier, for: indexPath) as! SliderImagesCell
            cell.sliderImg.image = UIImage(named: sliderImages[indexPath.row])
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.black.cgColor
            return cell
        }else if collectionView == subjectsListCollectionView {
            let cell1 = subjectsListCollectionView.dequeueReusableCell(withReuseIdentifier: DeshboardCell.identifier, for: indexPath) as! DeshboardCell
            let subObj = deshboardData[indexPath.row]
            cell1.lblSubName.text = subObj.subject_name
            cell1.layer.cornerRadius = 15
            cell1.clipsToBounds = true
            return cell1
        }
    
        return UICollectionViewCell()
    }
    
    
    
    //MARK:- Api call
    
    // Deshboard api

    func deshboardApi() {
        self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/dashboardk12-test"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let param = ["instid": 20, "email": "kavya8958p@gmail.com"] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.stopAnimating()
              do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                print(json)
                let obj = DeshboardModel(responce: json)
                if obj.status == "200" {
                    self.deshboardData = obj.subjects ?? []
                    DispatchQueue.main.async {
                        self.subjectsListCollectionView.reloadData()
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.displayAlert(with: "Error", message: obj.msg, buttons: ["ok"]) { (str) in
                            
                        }
                    }
                }
                    
                        print(json)
                        
                    }catch {
                    
                    }
                    
            
        }.resume()
    }
}
