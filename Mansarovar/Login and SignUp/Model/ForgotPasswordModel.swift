//
//  ForgotPasswordModel.swift
//  Mansarovar
//
//  Created by Sunil Developer on 04/12/22.
//

import Foundation
struct ForgotPasswordModel {
    var error: String?
    var msg: String?
    var status: String?
    init(response: [String: Any]) {
        self.error = response["error"] as? String
        self.msg = response["msg"] as? String
        self.status = response["status"] as? String
    }
}
