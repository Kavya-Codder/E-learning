//
//  UserModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//


//["name": Rita law student, "email": riya85@gmail.com, "error": Success, "phone": 8746453524, "msg": Success, "status": 200, "coursename": , "courseid": <null>]
import Foundation
struct UserModel {
    var name: String?
    var email: String?
    var phone: String?
    var error: String?
    var msg: String?
    var status: String?
    var coursename: String?
    var courseid: String?
    var key:String = ""
    
    enum keyValue: String {
        case name
        case email
        case phone
        case error
        case msg
        case status
        case coursename
        case courseid
        case key
    }
    
    init(dic: [String:AnyObject],key: String) {
        name = dic[keyValue.name.rawValue] as? String
        email = dic[keyValue.email.rawValue] as? String
        phone = dic[keyValue.phone.rawValue] as? String
        
        error = dic[keyValue.error.rawValue] as? String
        msg = dic[keyValue.msg.rawValue] as? String
        status = dic[keyValue.status.rawValue] as? String
        coursename = dic[keyValue.coursename.rawValue] as? String
        courseid = dic[keyValue.courseid.rawValue] as? String
        
        self.key = key
    }
    
}

