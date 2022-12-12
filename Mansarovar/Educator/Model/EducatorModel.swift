//
//  EducatorModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 12/12/22.
//

import Foundation
struct Educators {
    var t_id : Int?
    var num : Int?
    var name : String?
    var job_title : String?
    var email : String?
    var alias : String?
    var details : String?
    var inst_id : Int?
    var status : Int?
    var aadhar : String?
    var pancard : String?
    var bank_account : String?
    var ifsc : String?
    var image : String?
    var created_at : String?
    var updated_at : String?
    var instid : Int?
    init(response: [String: Any]) {
        self.t_id = response["t_id"] as? Int
        self.num = response["num"] as? Int
        self.name = response["name"] as? String
        self.job_title = response["job_title"] as? String
        self.email = response["email"] as? String
        self.alias = response["alias"] as? String
        self.details = response["details"] as? String
        self.inst_id = response["inst_id"] as? Int
        self.status = response["status"] as? Int
        self.aadhar = response["aadhar"] as? String
        self.pancard = response["pancard"] as? String
        self.bank_account = response["bank_account"] as? String
        self.ifsc = response["ifsc"] as? String
        self.image = response["image"] as? String
        self.created_at = response["created_at"] as? String
        self.updated_at = response["updated_at"] as? String
        self.instid = response["instid"] as? Int
    }
}
