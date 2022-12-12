//
//  PlanSetailVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import UIKit

class PlanDetailVC: UIViewController {
    
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var price = 0
    //var selectedTest:Tests?
    var arrVideo: [Videos] = []
    var arrTest: [String] = []
    var arrBook: [Ebooks] = []
    var courseObj: CourseModel?
    var subName = ""
    
    var subjectInfo:Topics?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topDataPopulated()
        courseDetailsApi()
        
        //lblTitle.text = subName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PlanVedioTVC.identifier, bundle: nil), forCellReuseIdentifier: PlanVedioTVC.identifier)
        
        tableView.register(UINib(nibName: PlanTestTVC.identifier, bundle: nil), forCellReuseIdentifier: PlanTestTVC.identifier)
        
        tableView.register(UINib(nibName: PlanEbookTVC.identifier, bundle: nil), forCellReuseIdentifier: PlanEbookTVC.identifier)

        
    }
    @IBAction func onClickBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onClickSegment(_ sender: Any) {
        tableView.reloadData()
    }
    
}

//Ectension

extension PlanDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segment.selectedSegmentIndex == 0 {
            return arrVideo.count
        } else if segment.selectedSegmentIndex == 1 {
            return arrTest.count
        } else  {
            return arrBook.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segment.selectedSegmentIndex == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: PlanVedioTVC.identifier, for: indexPath) as! PlanVedioTVC
            let vObj = arrVideo[indexPath.row]
            cell0.lblSubTitle.text = vObj.title ?? ""
            cell0.lblDuration.text = "Duration: \(vObj.duration ?? 0)"
            return cell0
            
        } else if segment.selectedSegmentIndex == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: PlanTestTVC.identifier, for: indexPath) as! PlanTestTVC
            let tObj = arrTest[indexPath.row]
            
            return cell1
            
        } else  {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: PlanEbookTVC.identifier, for: indexPath) as! PlanEbookTVC
            let bObj = arrBook[indexPath.row]
            cell2.lblBook.text = bObj.title
            return cell2
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segment.selectedSegmentIndex == 0
        {
            let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "ShowVideoVC") as! ShowVideoVC
            vc.vData = arrVideo[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
    }
        }
        
        
    // custom function
    
    func topDataPopulated(){
        if self.subjectInfo != nil{
//        let url = ApiManager.shared.Base_Url+(subjectInfo!.image ?? "")
//        imgBanner.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "demo"))
        
            lblTitle.text = subName
        price = subjectInfo!.price ?? 0
        }
    }
    
    //MARK:- Api call
    
    

    func courseDetailsApi() {
       // self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/course-details-k12"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let userId = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String
        let param = ["instid": 20, "email": userId ?? "", "courseid": courseObj?.c_id] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           // self.stopAnimating()
              do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                print(json)
                let obj = CourseBaseModel(response: json)
                if obj.status == "200" {

                    DispatchQueue.main.async {
                       // self.lblTitle.text = obj.course?.title
                        self.arrVideo = obj.videos ?? []
                        self.arrTest = obj.tests ?? []
                        self.arrBook = obj.ebooks ?? []
                        
                        self.tableView.reloadData()
//                        self.slider = obj.sliders ?? [""]
//                        self.lblTitle.text = obj.examInfo?.name ?? ""
//
//                        self.subjectsListCollectionView.reloadData()
//                        self.sliderCollectionView.reloadData()
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.displayAlert(with: "Error", message: obj.msg, buttons: ["ok"]) { (str) in
                            
                        }
                    }
                }
                    
                        print(json)
                        
                    }catch {
                    
                    }
                    
            
        }.resume()
    }
    
    
}
