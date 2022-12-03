//
//  LogIn.swift
//  Mansarovar
//
//  Created by Sunil Developer on 02/12/22.
//

import Foundation
struct LoginModel {
    var error: String?
    var msg: String?
    var status: String?
    var phone: String?
    var name: String?
    var courseid: String?
    var coursename: String?
    init(response: [String: Any]) {
        self.error = response["error"] as? String
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
        self.phone = response["phone"] as? String
        self.name = response["name"] as? String
        self.courseid = response["courseid"] as? String
        self.coursename = response["coursename"] as? String
    }
}
