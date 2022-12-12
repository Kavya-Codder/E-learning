//
//  DeshboardVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 03/12/22.
//

import UIKit
import SDWebImage

class DeshboardVC: UIViewController {
    
   
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var sliderPageControl: UIPageControl!
    
    @IBOutlet weak var subjectsListCollectionView: UICollectionView!
    
    @IBOutlet weak var topView: UIView!
    
    var slider: [String] = []
    var currentCelIndex = 0
    var lblSubTitle: ExamModel?
    var timer: Timer?
    var deshboardData: [SubjectModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetUp()
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
        let Width = (UIScreen.main.bounds.width - 40)/2
        Layout.itemSize = CGSize(width: Width, height: 170)
        Layout.minimumLineSpacing = 10
        Layout.minimumInteritemSpacing = 10
        Layout.sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 20, right: 15)
        Layout.scrollDirection = .vertical
        subjectsListCollectionView.collectionViewLayout = Layout
        
        
        
        // Timer
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideTonext), userInfo: nil, repeats: true)
       // sliderPageControl.numberOfPages = slider.count
        
    }
    override func viewWillAppear(_ animated: Bool) {
        deshboardApi()
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    @objc func slideTonext() {
        if currentCelIndex < slider.count - 1 {
            currentCelIndex = currentCelIndex + 1
            
        } else {
            currentCelIndex = 0
        }
        sliderPageControl.currentPage = currentCelIndex
        
        sliderCollectionView.scrollToItem(at: IndexPath(item: currentCelIndex, section: 0), at: .right, animated: true)
    }
    
    @IBAction func onClickLogOutBtn(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for aViewController in viewControllers {
            if aViewController is LoginVC {
                UserDefaults.standard.set(false, forKey: UserKeys.email.rawValue)
                self.navigationController!.popToViewController(aViewController, animated: true)
            }
        }
    }
    
    
    @IBAction func onClicknotificationBtn(_ sender: Any) {
        let notificationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        navigationController?.pushViewController(notificationVC, animated: true)
        
    }
    
    @IBAction func onClickTopBtn(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
//        let vc = UIStoryboard(name: "SelectClass", bundle: nil).instantiateViewController(withIdentifier: "SelectClassVC") as! SelectClassVC
//        navigationController?.pushViewController(vc, animated: true)
        
    }
   static func pushToNotificationVC() {
    
    }

}
extension DeshboardVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // table
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView {
            return slider.count
        }else if collectionView == subjectsListCollectionView {
            return deshboardData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: SliderImagesCell.identifier, for: indexPath) as! SliderImagesCell
           // cell.sliderImg.image = UIImage(named: sliderImages[indexPath.row])
            let sObj = slider[indexPath.row]
            let imageUrl = URL(string: "https://eteachnow.com/" + sObj)
            cell.sliderImg.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "chemistry"))
            
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor.black.cgColor
            return cell
        }else if collectionView == subjectsListCollectionView {
            let cell1 = subjectsListCollectionView.dequeueReusableCell(withReuseIdentifier: DeshboardCell.identifier, for: indexPath) as! DeshboardCell
            let subObj = deshboardData[indexPath.row]
            cell1.lblSubName.text = subObj.subject_name
           // lblTitle.text = subObj.subject_name
            cell1.layer.cornerRadius = 15
            cell1.clipsToBounds = true
            return cell1
        }
    
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "TopicListVC") as! TopicListVC
        
        vc.subid = "\(self.deshboardData[indexPath.row].subject_id ?? 0)"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func initialSetUp() {
        topView.clipsToBounds = true
        topView.layer.borderWidth = 1.0
        topView.layer.borderColor = UIColor.lightGray.cgColor
        topView.layer.cornerRadius = 15
        
    }
    
    //MARK:- Api call
    
    // Deshboard api

    func deshboardApi() {
       // self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/dashboardk12-test"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let userId = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String
        let param = ["instid": 20, "email": userId ?? ""] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           // self.stopAnimating()
              do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                print(json)
                let obj = DeshboardModel(response: json)
                if obj.status == "200" {
                    self.deshboardData = obj.subjects 
                    
                    
                    DispatchQueue.main.async {
                        self.slider = obj.sliders ?? []
                        self.sliderPageControl.numberOfPages = self.slider.count 
                        self.lblTitle.text = obj.examInfo?.name ?? ""
                        SelectClassVC.selectedExam = obj.examInfo
                        self.subjectsListCollectionView.reloadData()
                        self.sliderCollectionView.reloadData()
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
