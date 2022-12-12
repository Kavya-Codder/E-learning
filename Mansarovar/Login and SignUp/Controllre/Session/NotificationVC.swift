//
//  NotificationVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var notificationTableView: UITableView!
    
    var notification: [NotificationsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationApi()

        tabBarController?.tabBar.isHidden = true
        
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.register(UINib(nibName: NotificationCell.identifier, bundle: nil), forCellReuseIdentifier: NotificationCell.identifier)
    }
    
}

// Extension

// TableView
extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: NotificationCell.identifier, for: indexPath) as! NotificationCell
        let nObj = notification[indexPath.row]
        cell.lblTitle.text = nObj.title ?? ""
        cell.lblSubTitle.text = (nObj.content ?? "")
        return cell
        
    }
    
    // Api Call
    
    func notificationApi() {
        let apiNmae = "https://eteachnow.com/mobile/app/all-notifications"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = ["instid": 20, "email": "sunil12@gmail.com"] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
              do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                
                let Nobj = NotificationBaseModel(response: json)
                if Nobj.status == "200" {
                    self.notification = Nobj.notifications
                    DispatchQueue.main.async {
                        self.notificationTableView.reloadData()
                    }
                }
                print(json)
                        
                }catch {
                    
              }
                    
        }.resume()
    }
    
    
}
