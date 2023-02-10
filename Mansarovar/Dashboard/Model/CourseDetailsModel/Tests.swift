//
//  Tests.swift
//  Mansarovar
//
//  Created by Sunil Developer on 18/12/22.
//

import Foundation
struct Tests  {
    var test_id : Int?
    var title : String?
    var alias : String?
    var level : Int?
    var num : Int?
    var payment : String?
    var topicId : String?
    var details : String?
    var userId : Int?
    var teacher_id : Int?
    var status : Int?
    var total_time : Int?
    var pos_mark : Int?
    var neg_mark : Int?
    var course_id : Int?
    var type : String?
    var sub_id : Int?
    var exam_id : String?
    var sub_name : String?
    var ques_count : Int?
    var ques_type : String?
    var updated_at : String?
    var created_at : String?
    var instid : Int?
    var attempted : Int?
    
    init(response: [String: Any]) {
        self.test_id = response["test_id"] as? Int
        self.title = response["title"] as? String
        self.alias = response["alias"] as? String
        self.level = response["level"] as? Int
        self.num = response["num"] as? Int
        self.payment = response["payment"] as? String
        self.topicId = response["topicId"] as? String
        self.details = response["details"] as? String
        self.userId = response["userId"] as? Int
        self.teacher_id = response["teacher_id"] as? Int
        self.status = response["status"] as? Int
        self.total_time = response["total_time"] as? Int
        self.pos_mark = response["pos_mark"] as? Int
        self.neg_mark = response["neg_mark"] as? Int
        self.course_id = response["course_id"] as? Int
        self.type = response["type"] as? String
        self.sub_id = response["sub_id"] as? Int
        self.exam_id = response["exam_id"] as? String
        self.sub_name = response["sub_name"] as? String
        self.ques_count = response["ques_count"] as? Int
        self.updated_at = response["updated_at"] as? String
        self.created_at = response["created_at"] as? String
        self.attempted = response["attempted"] as? Int
        
        
    }
}
