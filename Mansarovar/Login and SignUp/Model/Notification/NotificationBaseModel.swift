//
//  NotificationModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import Foundation
import Foundation
struct NotificationBaseModel {
    let error : String?
    let status : String?
    var notifications : [NotificationsModel] = []
    
    init(response: [String: Any]) {
        self.error = response["error"] as? String
        self.status = response["status"] as? String
        if let data = response["notifications"] as? [[String: Any]] {
            data .forEach { responseDic in
                let nData = NotificationsModel(response: responseDic)
                notifications.append(nData)
            }
        }
    }
}
