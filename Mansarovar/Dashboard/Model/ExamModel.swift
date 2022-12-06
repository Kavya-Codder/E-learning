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
    init(responce: [String: Any]) {
        self.msg = responce["msg"] as? String
        self.status = responce["status"] as? String
        if let examData = responce["exams"] as? [[String: Any]] {
            examData.forEach { respnceDic in
                let examDetail = ExamModel(responce: respnceDic)
                exams.append(examDetail)
            }
        }
        self.show_pay_btn = responce["show_pay_btn"] as? Int
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
    init(responce: [String: Any]) {
        self.c_id = responce["c_id"] as? Int
        self.name = responce["name"] as? String
        self.name1 = responce["name1"] as? String
        self.alias = responce["alias"] as? String
        self.image = responce["image"] as? String
        self.details = responce["details"] as? String
        self.status = responce["status"] as? Int
        self.instid = responce["instid"] as? Int
        self.price = responce["price"] as? Int
        self.ori_price = responce["ori_price"] as? Int
        self.validity = responce["validity"] as? Int
        self.pay_model = responce["pay_model"] as? String
        self.youtube_id = responce["youtube_id"] as? String
    }
}
