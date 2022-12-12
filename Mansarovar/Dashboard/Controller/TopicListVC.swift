//
//  TopicListVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 07/12/22.
//

import UIKit

class TopicListVC: UIViewController {
    
    @IBOutlet weak var imgSubImage: UIImageView!
    @IBOutlet weak var lblSubName: UILabel!
    
    @IBOutlet weak var TLVSubject: UITableView!
    
    var subid = ""
    var topicsList: [Topics] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        apiTopic()

        TLVSubject.delegate = self
        TLVSubject.dataSource = self
        TLVSubject.register(UINib(nibName: TopicTVC.identifier, bundle: nil), forCellReuseIdentifier: TopicTVC.identifier)
    }
    

    @IBAction func onClickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// Extansion

extension TopicListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = TLVSubject.dequeueReusableCell(withIdentifier: TopicTVC.identifier, for: indexPath) as! TopicTVC
        let tObj = topicsList[indexPath.row]
        cell.lblTopic.text = tObj.name
//        print(tObj.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "TopicDetailListVC") as! TopicDetailListVC
        
        vc.subjectInfo = self.topicsList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Api call
    
    // TopicsList api

    func apiTopic() {
        //self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/get-subject-topics"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let userId = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String
        let param = ["email": userId ?? "", "subid": self.subid, "instid": 20] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           // self.stopAnimating()
              do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                
                let obj = TopicModel(response: json)
                
                if obj.status == "200" {
                    
                    DispatchQueue.main.async {
                        self.topicsList = obj.topics ?? []
                        self.lblSubName.text = obj.subject?.subject_name
//                        let imageUrl = URL(string: obj.subject?.image ?? "")
//                        //?.sliders?[indexPath.row] ?? "")
//                        self.imgSubImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "chemistry"))
                        self.TLVSubject.reloadData()
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
