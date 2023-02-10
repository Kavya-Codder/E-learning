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
    
    @IBOutlet weak var messageView: UIView!
    var commentData: [Comments] = []
    var vData: Videos?
    var subjest = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initialSetup()
        getCommentsList()
        
        tableView.register(UINib(nibName: ShowVideoTVC.identifier, bundle: nil), forCellReuseIdentifier: ShowVideoTVC.identifier)
        
        lblSubject.text = vData?.sub_name ?? ""
        //webServiceCommintsApi()
        
    }
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
// Extension

extension ShowVideoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowVideoTVC.identifier, for: indexPath) as! ShowVideoTVC
        let cObj = commentData[indexPath.row]
        cell.lblName.text = cObj.name
        cell.lblMsg.text = cObj.message
        return cell
    }
    
    func initialSetup() {
        sendBtn.clipsToBounds = true
        sendBtn.layer.cornerRadius = 25
        
        messageView.clipsToBounds = true
        messageView.layer.cornerRadius = 15
        
        
        
    }
    
    //MARK:- Api call
    
    
    // getCommints

    func getCommentsList() {
       // self.startAnimation()
        let param = ["instid": 20, "email": ApiManager.userEmail ?? "", "videoid": 15696] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.commentList, inputParam: param) { (jsonResponse, error, success) in
            if success {
                if let response = jsonResponse {
                    let obj = CommentsBaseModel(response: response)
                    DispatchQueue.main.async {
                        self.commentData = obj.comments ?? []
                        
                        
                    }
                }
            }
        }
    }
    
}
