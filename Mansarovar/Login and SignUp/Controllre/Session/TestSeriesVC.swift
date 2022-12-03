//
//  TestSeriesVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 03/12/22.
//

import UIKit

class TestSeriesVC: UIViewController {

    @IBOutlet weak var ClVTestSeries: UICollectionView!
    
    var allTestSeries: [AllSeriesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiAllTestSeries()
        
        ClVTestSeries.delegate = self
        ClVTestSeries.dataSource = self
        ClVTestSeries.register(UINib(nibName: TestSeriesCell.identifier, bundle: nil), forCellWithReuseIdentifier: TestSeriesCell.identifier)
        
       let layout = UICollectionViewFlowLayout()
        let cellWidth = (UIScreen.main.bounds.width - 60)/2
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        layout.itemSize = CGSize(width: cellWidth, height: 170)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 20, bottom: 10, right: 20)
        layout.scrollDirection = .vertical
        ClVTestSeries.collectionViewLayout = layout

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    

}
extension TestSeriesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTestSeries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ClVTestSeries.dequeueReusableCell(withReuseIdentifier: TestSeriesCell.identifier, for: indexPath) as! TestSeriesCell
        let obj = allTestSeries[indexPath.row]
        cell.lblNoOfTest.text = "\(obj.num)"
        cell.lblTestSeriesTitle.text = "\(obj.title)"
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor(named: "loginButton")?.cgColor
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
    func apiAllTestSeries() {
        let apiName = "https://eteachnow.com/mobile/app/all-testseries-global"
        guard let url = URL(string: apiName) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = ["instid": 31] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                let seriesData = AllTestSeriesBaseModel(response: json)
                DispatchQueue.main.async {
                    self.allTestSeries = seriesData.allseries ?? []
                    self.ClVTestSeries.reloadData()
                }
               
                print(json)
                
            }catch {
                
            }
        }.resume()
    }
    
    
}
