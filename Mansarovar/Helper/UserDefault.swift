//
//  UserDefault.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import Foundation
enum UserKeys: String {
    case name
    case email
    case phone
    case error
    case msg
    case status
    case coursename
    case courseid
    case key
    case isLoggedIn
}
extension UserDefaults {
    class func saveUserVales(user: LoginModel?)  {
    UserDefaults.standard.set(user?.name ?? "" ,forKey: UserKeys.name.rawValue)
    UserDefaults.standard.set(user?.email ?? "", forKey: UserKeys.email.rawValue)
    UserDefaults.standard.set(user?.phone ?? "" ,forKey: UserKeys.phone.rawValue)
    UserDefaults.standard.set(user?.error ?? "", forKey: UserKeys.error.rawValue)
    UserDefaults.standard.set(user?.msg ?? "" ,forKey: UserKeys.msg.rawValue)
    UserDefaults.standard.set(user?.status ?? "", forKey: UserKeys.status.rawValue)
    UserDefaults.standard.set(user?.coursename ?? "" ,forKey: UserKeys.coursename.rawValue)
    UserDefaults.standard.set(user?.courseid ?? "", forKey: UserKeys.courseid.rawValue)
    
    }
 
}
