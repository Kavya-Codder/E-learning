//
//  TopicModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import Foundation
struct TopicModel {
    var msg : String?
    var status : String?
    var topics : [Topics] = []
    var subject : SubjectModel?
    
    init(response: [String: Any]) {
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
        if let data = response["topics"] as? [[String: Any]] {
            data.forEach { responseDic in
                let tdata = Topics(response: responseDic)
                topics.append(tdata)
                
            }
        }
        if let subData = response["subject"] as? [String: Any] {
            self.subject = SubjectModel(respnse: subData)
        }
           
    }
}

