//
//  EducatorVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import UIKit
import SDWebImage
import SideMenu

class EducatorVC: UIViewController {
    
    
    @IBOutlet weak var educatorCollectionView: UICollectionView!
    var arrEducator: [Educators] = []
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: ListController())
        menu?.leftSide = true
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        SideMenuManager.default.leftMenuNavigationController = menu
        menu?.setNavigationBarHidden(true, animated: true)
        
        educatorApi()
        educatorCollectionView.delegate = self
        educatorCollectionView.dataSource = self
        educatorCollectionView.register(UINib(nibName: EducatorListCell.identifier, bundle: nil), forCellWithReuseIdentifier: EducatorListCell.identifier)
        
        // collectionView Layout
        let Layout = UICollectionViewFlowLayout()
        let Width = (UIScreen.main.bounds.width - 40)/3
        Layout.itemSize = CGSize(width: Width, height: 170)
        Layout.minimumLineSpacing = 10
        Layout.minimumInteritemSpacing = 5
        Layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 20, right: 10)
        Layout.scrollDirection = .vertical
        educatorCollectionView.collectionViewLayout = Layout
    }
    
    
    @IBAction func onClickMenuBtn(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
}

//MARK:- TableView Delegate and datasoure
extension EducatorVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrEducator.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = educatorCollectionView.dequeueReusableCell(withReuseIdentifier: EducatorListCell.identifier, for: indexPath) as! EducatorListCell
        let obj = arrEducator[indexPath.row]
        cell.lblName.text = obj.name ?? ""
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.black.cgColor
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        // let imageUrl = URL(string: obj.image ?? "")
        let imageUrl = URL(string: "https://eteachnow.com/" + (obj.image ?? ""))
        cell.imgEducator.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "man"))
        //cell.layer.cornerRadius = 8
        return cell
    }
    
    //MARK:- Api Calling
    
    func educatorApi() {
        self.startAnimation()
        let param = ["instid": 20] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.allEducator, inputParam: param) { (jsonResponse, error, success) in
            self.stopAnimating()
            if success {
                if let response = jsonResponse {
                    let eObj = EducatorBaseModel(response: response)
                    self.arrEducator = eObj.educators
                    DispatchQueue.main.async {
                        self.educatorCollectionView.reloadData()
                    }
                }
                
            }
        }
       
    }
    
    
}
