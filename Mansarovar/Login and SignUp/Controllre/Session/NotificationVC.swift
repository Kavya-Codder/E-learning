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
    
   // MARK:-  Api Call

    func notificationApi() {
        startAnimating()
        let param = ["instid": 20, "email": "sunil12@gmail.com"] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.notification, inputParam: param) { (jsonResponse, reeor, success) in
            self.stopAnimating()
            if success {
                if let response = jsonResponse {
                    let obj = NotificationBaseModel(response: response)
                    self.notification = obj.notifications
                    DispatchQueue.main.async {
                        self.notificationTableView.reloadData()
                    }
                }
            }
        }
        
    }
}
