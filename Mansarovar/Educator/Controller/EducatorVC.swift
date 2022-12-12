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
        cell.imgEducator.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "chemistry"))
        cell.layer.cornerRadius = 8
        return cell
    }
    
    // Api Call
    
    func educatorApi() {
        let apiNmae = "https://eteachnow.com/mobile/app/get-educator-list"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = ["instid": 20] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
              do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                
                let eObj = EducatorBaseModel(response: json)
                if eObj.status == "200" {
                    self.arrEducator = eObj.educators
                    DispatchQueue.main.async {
                        self.educatorCollectionView.reloadData()
                    }
                }
                print(json)
                        
                }catch {
                    
              }
                    
        }.resume()
    }
    
    
}
