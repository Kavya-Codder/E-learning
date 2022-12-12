//
//  Videos.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import Foundation

struct Videos {
    var video_id: Int?
    var num: Int?
    var title: String?
    var details: String?
    var url: String?
    var gurl: String?
    var source: String?
    var payment: String?
    var duration: Int?
    var livestream: Int?
    var status: Int?
    var teacher_id: Int?
    var sub_id: Int?
    var sub_name: String?
    var instId: Int?
    var course_id: Int?
    var allowed_view: Int?
    var allowed_time: Int?
    var livenow: Int?
    var liveserver: String?
    var schedule: String?
    var show_comment: Int?
    
    init(response: [String: Any]) {
        self.video_id = response["video_id"] as? Int
        self.num = response["num"] as? Int
        self.title = response["title"] as? String
        self.details = response["details"] as? String
        self.url = response["url"] as? String
        self.gurl = response["gurl"] as? String
        self.source = response["source"] as? String
        self.payment = response["payment"] as? String
        self.duration = response["duration"] as? Int
        self.livestream = response["livestream"] as? Int
        self.status = response["status"] as? Int
        self.teacher_id = response["teacher_id"] as? Int
        self.sub_id = response["sub_id"] as? Int
        self.sub_name = response["sub_name"] as? String
        self.instId = response["instId"] as? Int
        self.course_id = response["course_id"] as? Int
        self.allowed_view = response["allowed_view"] as? Int
        self.allowed_time = response["allowed_time"] as? Int
        self.livenow = response["livenow"] as? Int
        self.liveserver = response["liveserver"] as? String
        self.schedule = response["schedule"] as? String
        self.show_comment = response["show_comment"] as? Int
    }

}
