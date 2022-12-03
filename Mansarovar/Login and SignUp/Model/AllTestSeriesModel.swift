//
//  AllTestSeriesModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 03/12/22.
//

import Foundation

struct AllTestSeriesBaseModel {
       var msg: String?
       var status: String?
       var allseries: [AllSeriesModel] = []
       var subjects: [String]?
    init(response: [String: Any]) {
        self.msg = response["msg"] as? String
        self.msg = response["msg"] as? String
        if let seriesData = response["allseries"] as? [[String: Any]] {
            seriesData .forEach { responseDic in
                let data = AllSeriesModel(response: responseDic)
                allseries.append(data)
            }
        }
        self.subjects = response["subject"] as? [String]
    }
}

struct AllSeriesModel {
    var id : Int?
    var title : String?
    var alias : String?
    var details : String?
    var sub_id : Int?
    var exam_id : Int?
    var price : Int?
    var validity : Int?
    var num : Int?
    var status : Int?
    var image : String?
    var items : Int?
    var created_at : String?
    var updated_at : String?
    var instid : Int?
    var t_count : Int?
    init(response: [String: Any]) {
        self.id = response["id"] as? Int
        self.title = response["title"] as? String
        self.alias = response["alias"] as? String
        self.details = response["details"] as? String
        self.sub_id = response["sub_id"] as? Int
        self.exam_id = response["exam_id"] as? Int
        self.price = response["price"] as? Int
        self.validity = response["validity"] as? Int
        self.num = response["num"] as? Int
        self.status = response["status"] as? Int
        self.image = response["image"] as? String
        self.items = response["items"] as? Int
        self.created_at = response["created_at"] as? String
        self.updated_at = response["updated_at"] as? String
        self.instid = response["instid"] as? Int
        self.t_count = response["t_count"] as? Int
    }
}
