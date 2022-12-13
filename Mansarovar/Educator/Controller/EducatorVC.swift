//
//  EducatorVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import UIKit
import SDWebImage

class EducatorVC: UIViewController {
    
    
    @IBOutlet weak var educatorCollectionView: UICollectionView!
    var arrEducator: [Educators] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        educatorApi()
        educatorCollectionView.delegate = self
        educatorCollectionView.dataSource = self
        educatorCollectionView.register(UINib(nibName: EducatorListCell.identifier, bundle: nil), forCellWithReuseIdentifier: EducatorListCell.identifier)
        
        // collectionView Layout
        let Layout = UICollectionViewFlowLayout()
        let Width = (UIScreen.main.bounds.width - 40)/3
        Layout.itemSize = CGSize(width: Width, height: 180)
        Layout.minimumLineSpacing = 10
        Layout.minimumInteritemSpacing = 5
        Layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 20, right: 10)
        Layout.scrollDirection = .vertical
        educatorCollectionView.collectionViewLayout = Layout
    }
    
    
    
}

//   Extension
extension EducatorVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrEducator.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = educatorCollectionView.dequeueReusableCell(withReuseIdentifier: EducatorListCell.identifier, for: indexPath) as! EducatorListCell
        let obj = arrEducator[indexPath.row]
        cell.lblName.text = obj.name ?? ""
        // let imageUrl = URL(string: obj.image ?? "")
        let imageUrl = URL(string: "https://eteachnow.com/" + (obj.image ?? ""))
        cell.imgEducator.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "man"))
        cell.layer.cornerRadius = 8
        return cell
    }
    
    //  MARK:- Api Call
    
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
