//
//  Notifications.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import Foundation
struct NotificationsModel {
    let n_id : Int?
    let created_at : String?
    let updated_at : String?
    let instid : Int?
    let user_id : String?
    let title : String?
    let videoid : String?
    let content : String?
    let type : String?
    let status : String?
    let priority : String?
    
    init(response: [String: Any]) {
        self.n_id = response["n_id"] as? Int
        self.created_at = response["created_at"] as? String
        self.updated_at = response["updated_at"] as? String
        self.instid = response["instid"] as? Int
        self.user_id = response["user_id"] as? String
        self.title = response["title"] as? String
        self.videoid = response["videoid"] as? String
        self.content = response["content"] as? String
        self.type = response["type"] as? String
        self.status = response["status"] as? String
        self.priority = response["priority"] as? String
       
    }
}
