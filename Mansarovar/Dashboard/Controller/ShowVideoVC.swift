//
//  ShowVideoVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import UIKit
import WebKit

class ShowVideoVC: UIViewController {
    
    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    
    var commentData: [Comments] = []
    var vData: Videos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ShowVideoTVC.identifier, bundle: nil), forCellReuseIdentifier: ShowVideoTVC.identifier)
        
        lblSubject.text = vData?.sub_name ?? ""
        webServiceCommintsApi()
        
    }
    


}
// Extension

extension ShowVideoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowVideoTVC.identifier, for: indexPath) as! ShowVideoTVC
        return cell
    }
    
    //MARK:- Api call
    
    // getCommints

    func webServiceCommintsApi() {
       // self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/video/get-top-comments"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let userId = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String
        let param = ["instid": 20, "email": userId ?? ""] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           // self.stopAnimating()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! NSArray
                if let data = json as? [[String: AnyObject]] {
                    data.forEach { responseDic in
                        let comment = Comments(response: responseDic)
                        self.commentData.append(comment)
                    }
                 }
                DispatchQueue.main.async {
                    
                    
                }
                print(json)
            } catch {
                
            }
        }.resume()
    }
    
}
