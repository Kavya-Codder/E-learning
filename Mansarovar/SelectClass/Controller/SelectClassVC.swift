//
//  SelectClassVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 05/12/22.
//

import UIKit
import SideMenu

class SelectClassVC: UIViewController {

    @IBOutlet weak var selectClassTableView: UITableView!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    var arrOfExam: [ExamModel] = []
    var selected = -1
    var examsID = 0
    static var selectedExam: ExamModel?
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        
        menu = SideMenuNavigationController(rootViewController: ListController())
        menu?.leftSide = true
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        SideMenuManager.default.leftMenuNavigationController = menu
        menu?.setNavigationBarHidden(true, animated: true)
        
        selectClassTableView.delegate = self
        selectClassTableView.dataSource = self
        selectClassTableView.register(UINib(nibName: SelectClassTVC.identifier, bundle: nil), forCellReuseIdentifier: SelectClassTVC.identifier)
        selectClassTableView.rowHeight = 80
        
        apiExam()
        
    }
    
    @IBAction func onClickMenuBtn(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func onClickSubmitBtn(_ sender: Any) {
        
        if selected != -1 {
            toUpdateExam()
            
        } else {
            showAlert(title: "", message: "Please Select Class") { (str) in
                
            }
        }
    }
    
    @IBAction func onClickNotificationBtn(_ sender: Any) {
        let notificationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        navigationController?.pushViewController(notificationVC, animated: true)
    }
    
}

//MARK:- TableView Delegate and datasoure

extension SelectClassVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfExam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectClassTableView.dequeueReusableCell(withIdentifier: SelectClassTVC.identifier, for: indexPath) as! SelectClassTVC
        let objExam = arrOfExam[indexPath.row]
        
        cell.lblClassName.text = objExam.name
        if selected == -1 {
            if(objExam.name ?? "") == SelectClassVC.selectedExam?.name ?? "" {
                cell.imgSelect.isHidden = false
                self.selected = indexPath.row
               }else {
                cell.imgSelect.isHidden = true
                  }
           }else{
              if self.selected == indexPath.row{
                cell.imgSelect.isHidden = false
              }else{
                cell.imgSelect.isHidden = true
              }
              }
              return cell
          }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = indexPath.row
        
        self.selectClassTableView.reloadData()
    }


    func pushToDeshboardVC() {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DeshboardVC") as! DeshboardVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func initialSetUp() {
        btnSubmit.clipsToBounds = true
        btnSubmit.layer.cornerRadius = 15
    }
    //MARK:- Api Calling
    
    // AllExam api

    func apiExam() {
       // self.startAnimation()
        let param = ["instid": 20, "email": ApiManager.userEmail ?? ""] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.allExams, inputParam: param) { (jsonResponse, error, success) in
            //self.stopAnimating()
            if success {
                if let response = jsonResponse {
                    let obj = ExamBaseModel(response: response)
                    DispatchQueue.main.async {
                        self.arrOfExam = obj.exams
                        self.examsID = obj.exams.first?.c_id ?? 0
                        self.selectClassTableView.reloadData()
                        
                    }
                }
            }
        }
    }
    
    // update api
    
    func toUpdateExam() {
        
        if selected != nil {
            self.examsID = arrOfExam[self.selected].c_id ?? 0
        }
       self.startAnimation()
        let param = ["email": ApiManager.userEmail ?? "", "examid": self.examsID, "instid": 20] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.updateExam, inputParam: param) { (jsonResponse, error, success) in
            self.stopAnimating()
            if success {
                if let response = jsonResponse {
                    let obj = UpdateExamModel(response: response)
                    DispatchQueue.main.async {
                        self.selectClassTableView.reloadData()
                       self.tabBarController?.selectedIndex = 0
                    }
                }
            }
        }
    }
    
}
    
