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
        var examInfo : ExamModel?
        var subjects : [SubjectModel] = []
        var sliders : [String]?

    init(response: [String: Any]) {
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
        self.error = response["error"] as? String
        if let examInfoExam = response["examInfo"] as? [String: Any] {
            self.examInfo = ExamModel(response: examInfoExam)
        }
           
        if let Data = response["subjects"] as? [[String: Any]] {
            Data.forEach { respnceDic in
                let subData = SubjectModel(respnse: respnceDic)
                subjects.append(subData)
            }
        }
        self.sliders = response["sliders"] as? [String]
        
    }
}

