//
//  ForgotPasswordVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 02/12/22.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var btnChangeMyPassword: UIButton!
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        lblEmail.isHidden = true
    
    }
    
    @IBAction func onClickChangePassBtn(_ sender: Any) {
        apiForgotPassword()
    }
    
   
    @IBAction func onClickTxtEmail(_ sender: Any) {
        lblEmail.isHidden = false
    }
    
    
    
    @IBAction func onClickBackBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func initialSetUp() {

        
        viewContainer.clipsToBounds = true
        viewContainer.layer.cornerRadius = 40
        viewContainer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        btnChangeMyPassword.clipsToBounds = true
        btnChangeMyPassword.layer.cornerRadius = 20

}
    
    func apiForgotPassword() {
        let apiNmae = "https://eteachnow.com/mobile/app/user/register"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = ["instid": 31, "email": "joshuatimon8@gmail.com"] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
               
                print(json)
                
            }catch {
                
            }
        }.resume()
    }
    
   
}
