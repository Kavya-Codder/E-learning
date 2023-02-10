//
//  CommentsModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import Foundation
struct Comments {
    let c_id : Int?
    let video_id : Int?
    let name : String?
    let message : String?
    let status : Int?
    let submittime : String?
    let user_id : Int?
    let instid : Int?
    let has_recording : String?
    let recording : String?
    let has_file : String?
    let file : String?
    init(response: [String: Any]) {
        self.c_id = response["c_id"] as? Int
        self.video_id = response["video_id"] as? Int
        self.name = response["name"] as? String
        self.message = response["message"] as? String
        self.status = response["status"] as? Int
        self.submittime = response["submittime"] as? String
        self.user_id = response["user_id"] as? Int
        self.instid = response["instid"] as? Int
        self.has_recording = response["has_recording"] as? String
        self.recording = response["recording"] as? String
        self.has_file = response["has_file"] as? String
        self.file = response["file"] as? String
    }
    
}
