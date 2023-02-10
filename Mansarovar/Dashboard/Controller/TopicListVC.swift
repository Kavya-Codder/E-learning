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
        self.startAnimation()
        let param = ["email": ApiManager.userEmail ?? "", "subid": self.subid, "instid": 20] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.get_subject_topic, inputParam: param) { (jsonResponse, error, success) in
            self.stopAnimating()
            if success {
                if let response = jsonResponse {
                    let obj = TopicModel(response: response)
                    DispatchQueue.main.async {
                        self.topicsList = obj.topics ?? []
                        self.lblSubName.text = obj.subject?.subject_name
                        self.TLVSubject.reloadData()
                    }
                }
            }
        }
    }
}
