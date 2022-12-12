//
//  TopicCourseModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 07/12/22.
//

import Foundation
struct TopicCourseModel {
    var msg : String?
    var status : String?
    var courses : [CourseModel] = []
    var topicInfo : Topics?
    init(response: [String: Any]) {
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
        if let data = response["courses"] as? [[String: Any]] {
            data .forEach { responseDic in
                let cdata = CourseModel(response: responseDic)
                courses.append(cdata)
                
            }
        }
        self.topicInfo = Topics(response: response["topicInfo"] as! [String: Any])
    }
}
