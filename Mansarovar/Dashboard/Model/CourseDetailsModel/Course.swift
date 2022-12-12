//
//  Courses.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import Foundation

struct Course  {
    var c_id : Int?
    var title : String?
    var alias : String?
    var details : String?
    var topic_id : Int?
    var sub_id : Int?
    var exam_id : Int?
    var price : Int?
    var num : Int?
    var live : Int?
    var status : Int?
    var validity : Int?
    var teacher_id : Int?
    var teacher_name : Int?
    var image : String?
    var items : Int?
    var created_at : String?
    var updated_at : String?
    var instid : Int?
    var v_count : Int?
    var e_count : Int?
    var t_count : Int?
    var pay_model : String?
    var livenow : Int?
    var highlight : Int?
    
    init(response: [String: Any]) {
        self.c_id = response["c_id"] as? Int
        self.title = response["title"] as? String
        self.alias = response["alias"] as? String
        self.details = response["details"] as? String
        self.topic_id = response["topic_id"] as? Int
        self.sub_id = response["sub_id"] as? Int
        self.exam_id = response["exam_id"] as? Int
        self.price = response["price"] as? Int
        self.num = response["num"] as? Int
        self.live = response["live"] as? Int
        self.status = response["status"] as? Int
        self.validity = response["validity"] as? Int
        self.teacher_id = response["teacher_id"] as? Int
        self.teacher_name = response["teacher_name"] as? Int
        self.image = response["image"] as? String
        self.items = response["items"] as? Int
        self.created_at = response["created_at"] as? String
        self.updated_at = response["updated_at"] as? String
        self.instid = response["instid"] as? Int
        self.v_count = response["v_count"] as? Int
        self.e_count = response["e_count"] as? Int
        self.t_count = response["t_count"] as? Int
        self.pay_model = response["pay_model"] as? String
        self.livenow = response["livenow"] as? Int
        self.highlight = response["highlight"] as? Int
    }
    
}
