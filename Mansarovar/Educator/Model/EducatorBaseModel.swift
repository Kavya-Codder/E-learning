//
//  EducatorBaseModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 12/12/22.
//

import Foundation

struct EducatorBaseModel {
    var msg : String?
    var status : String?
    var educators : [Educators] = []
    
    init(response: [String: Any]) {
        self.msg = response["msg"]as? String
        self.status = response["status"]as? String
        if let data = response["educators"] as? [[String: Any]] {
            data.forEach { responseDic in
            let eData = Educators(response: responseDic)
                educators.append(eData)
        }
    }
        
    }
}
