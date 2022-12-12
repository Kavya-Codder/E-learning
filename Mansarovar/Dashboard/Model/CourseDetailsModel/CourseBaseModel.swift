//
//  CourseBaseModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import Foundation

struct CourseBaseModel {
    var msg : String?
    var status : String?
    var show_pay_btn : Int?
    var course : Course?
    var videos : [Videos] = []
    var tests : [String]?
    var ebooks : [Ebooks] = []
    var paidStatus : Int?
    var confs : [String]?
    var free_videos : Int?
    
    init(response: [String: Any]) {
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
        self.show_pay_btn = response["show_pay_btn"] as? Int
        
        self.course = Course(response: response["course"] as! [String: Any])
        
        if let vData = response["videos"] as? [[String: Any]] {
        vData.forEach { responseDic in
            let videoData = Videos(response: responseDic)
            videos.append(videoData)
        }
    }
        
        if let eData = response["ebooks"] as? [[String: Any]] {
            eData.forEach { responseDic in
                let ebookData = Ebooks(response: responseDic)
                ebooks.append(ebookData)
                
            }
        }
        
        self.tests = response["tests"] as? [String]
        self.paidStatus = response["paidStatus"] as? Int
        self.confs = response["confs"] as? [String]
        self.free_videos = response["free_videos"] as? Int
        
        
    }
}
