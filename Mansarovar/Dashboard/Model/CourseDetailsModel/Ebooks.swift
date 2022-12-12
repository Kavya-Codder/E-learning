//
//  Ebooks.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import Foundation
struct Ebooks  {
    var e_id : Int?
    var title : String?
    var details : String?
    var author : String?
    var image : String?
    var eurl : String?
    var price : Int?
    var teacher_id : Int?
    var sub_id : Int?
    var sub_name : String?
    var rating : Int?
    var status : Int?
    var payment : String?
    var download : Int?
    var course_id : Int?
    var num : Int?
    var instid : Int?
    init(response: [String: Any]) {
        self.e_id = response["e_id"] as? Int
        self.title = response["title"] as? String
        self.details = response["details"] as? String
        self.author = response["author"] as? String
        self.image = response["image"] as? String
        self.eurl = response["eurl"] as? String
        self.price = response["price"] as? Int
        self.teacher_id = response["teacher_id"] as? Int
        self.sub_id = response["sub_id"] as? Int
        self.sub_name = response["sub_name"] as? String
        self.rating = response["rating"] as? Int
        self.status = response["status"] as? Int
        self.payment = response["payment"] as? String
        self.download = response["download"] as? Int
        self.course_id = response["course_id"] as? Int
        self.num = response["num"] as? Int
        self.instid = response["instid"] as? Int
       
    }
}
