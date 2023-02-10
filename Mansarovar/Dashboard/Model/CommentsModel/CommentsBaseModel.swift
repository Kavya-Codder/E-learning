//
//  CommentsBaseModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 24/12/22.
//

import Foundation
struct CommentsBaseModel{
    var msg : String?
    var status : String?
    var comments : [Comments] = []

    init(response: [String:Any]) {
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
        
        if let data = response["comments"] as? [[String: Any]] {
            data.forEach { respinseDic in
                let cData = Comments(response: respinseDic)
                comments.append(cData)
                
            }
        }
    }
}
