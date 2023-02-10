//
//  ApiManager.swift
//  Mansarovar
//
//  Created by Sunil Developer on 13/12/22.
//

import Foundation
enum HttpRequestType: String {
    case POST = "POST"
    case GET = "GET"
    case DELETE = "DELETE"
    case PUT = "PUT"
    
}
class ApiManager {
   // static let shared = ApiManager()
    
    // Base url
    
     static let baseUrl = "https://eteachnow.com/mobile/app/"
    
    // End points
    
    static let logIn = ApiManager.baseUrl + "user/login"
    static let signUp = ApiManager.baseUrl + "user/register"
    static let forgotPassword = ApiManager.baseUrl + "user/forgetpassword"
    static let notification = ApiManager.baseUrl + "all-notifications"
    static let  deshboard = ApiManager.baseUrl + "dashboardk12-test"
    static let get_subject_topic = ApiManager.baseUrl + "get-subject-topics"
    static let topic_courses_k12 = ApiManager.baseUrl + "topic-courses-k12"
    static let courseDetails = ApiManager.baseUrl + "course-details-k12"
    static let get_Videos = ApiManager.baseUrl + "video/get-top-comments"
    static let updateExam = ApiManager.baseUrl + "update-exam"
    static let allEducator = ApiManager.baseUrl + "get-educator-list"
    static let allExams = ApiManager.baseUrl + "all-exams"
    static let allTestSeries = ApiManager.baseUrl + "all-testseries-global"
    static let commentList = ApiManager.baseUrl + "video/get-top-comments-json"
    static let addComment = ApiManager.baseUrl + "video/add-comment"
    
    static var userEmail = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String
    
  static  func networdRequest(requestType: HttpRequestType, apiUrl: String, inputParam: [String: Any], complition: @escaping ((Dictionary<String, Any>)?, Error?, Bool) -> Void) {
        // self.startAnimation()
        guard let url = URL(string: apiUrl) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: inputParam, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            //  self.stopAnimating()
            do {
                
                if let jsonData = data {
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: .fragmentsAllowed) as! Dictionary<String, Any>
                    complition(json, nil, true)
                    
                    print(json)
                } else {
                    complition(nil, nil, false)
                }
                
                
            }catch (let error ) {
                complition(nil, error, false)
            }
            
        }.resume()
    }
    
}
