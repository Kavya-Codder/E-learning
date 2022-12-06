//
//  DeshboardModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 06/12/22.
//

import Foundation
struct DeshboardModel {
        var msg : String?
        var status : String?
        var error : String?
    
    //        var examPaidStatus : ExamPaidStatus?
        var examInfo : [ExamModel] = []
        var subjects : [SubjectModel] = []
//        var sliders : [String]?

    init(responce: [String: Any]) {
        self.msg = responce["msg"] as? String
        self.status = responce["status"] as? String
        self.error = responce["error"] as? String
        if let examData = responce["examInfo"] as? [[String: Any]] {
            examData.forEach { respnceDic in
                let examDetail = ExamModel(responce: respnceDic)
                examInfo.append(examDetail)
            }
        }
        if let Data = responce["subjects"] as? [[String: Any]] {
            Data.forEach { respnceDic in
                let subData = SubjectModel(respnce: respnceDic)
                subjects.append(subData)
            }
        }
        
    }
}
