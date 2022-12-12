//
//  TopicDetailList.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import UIKit
import SDWebImage

class TopicDetailListVC: UIViewController {

    @IBOutlet weak var lblTopicName: UILabel!
    @IBOutlet weak var detaliTableView: UITableView!
    
    var subjectInfo:Topics?
    var subjectId = ""
    var topicid = 0
    var courses : [CourseModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        APICallingTogetallTopicCoursesList()

        detaliTableView.delegate = self
        detaliTableView.dataSource = self
        detaliTableView.register(UINib(nibName: TopicDetailsTVC.identifier, bundle: nil), forCellReuseIdentifier: TopicDetailsTVC.identifier)
    }
    
    @IBAction func btnBack(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
    

}

// Extension

extension TopicDetailListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detaliTableView.dequeueReusableCell(withIdentifier: TopicDetailsTVC.identifier, for: indexPath) as! TopicDetailsTVC
         
        let cObj = courses[indexPath.row]
        cell.lblCourseTitle.text = cObj.title
        cell.lblV_Count.text = "\(cObj.v_count ?? 0) videos"
        cell.lblE_Count.text = "\(cObj.e_count ?? 0) ebooks"
        cell.lblT_Count.text = "\(cObj.t_count ?? 0) tests"
        
        let imageUrl = URL(string: cObj.image ?? "")
        cell.imageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "chemistry"))
           return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "PlanDetailVC") as! PlanDetailVC
        vc.courseObj = self.courses[indexPath.row]
        //vc.courseId = self.courses[indexPath.row].c_id ?? 0
       // vc.subName = self.courses[indexPath.row].title ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- API calling
    
    func APICallingTogetallTopicCoursesList() {
        //self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/topic-courses-k12"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let userId = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String
        let param = ["email": userId ?? "", "topicid": subjectInfo?.id ?? "", "instid": 20] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            //self.stopAnimating()
              do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                
                let obj = TopicCourseModel(response: json)
                
                if obj.status == "200" {
                    
                    DispatchQueue.main.async {
                        self.courses = obj.courses ?? []
                        self.subjectInfo = obj.topicInfo
                        self.lblTopicName.text = obj.topicInfo?.name ?? ""
                       
                        self.detaliTableView.reloadData()
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
    

