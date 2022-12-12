//
//  ExamModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 05/12/22.
//

import Foundation
struct ExamBaseModel {
    var msg: String?
    var status: String?
    var exams: [ExamModel] = []
    var show_pay_btn: Int?
    init(response: [String: Any]) {
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
        if let examData = response["exams"] as? [[String: Any]] {
            examData.forEach { respnceDic in
                let examDetail = ExamModel(response: respnceDic)
                exams.append(examDetail)
            }
        }
        self.show_pay_btn = response["show_pay_btn"] as? Int
    }
}
struct ExamModel {
    var c_id : Int?
    var name : String?
    var name1 : String?
    var alias : String?
    var image : String?
    var details : String?
    var status : Int?
    var instid : Int?
    var price : Int?
    var ori_price : Int?
    var validity : Int?
    var pay_model : String?
    var youtube_id: String?
    init(response: [String: Any]) {
        self.c_id = response["c_id"] as? Int
        self.name = response["name"] as? String
        self.name1 = response["name1"] as? String
        self.alias = response["alias"] as? String
        self.image = response["image"] as? String
        self.details = response["details"] as? String
        self.status = response["status"] as? Int
        self.instid = response["instid"] as? Int
        self.price = response["price"] as? Int
        self.ori_price = response["ori_price"] as? Int
        self.validity = response["validity"] as? Int
        self.pay_model = response["pay_model"] as? String
        self.youtube_id = response["youtube_id"] as? String
    }
}
