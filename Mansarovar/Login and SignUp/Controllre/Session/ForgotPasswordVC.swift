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
        self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/user/forgetpassword"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = ["instid": 31, "email": txtEmail.text ?? ""] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.stopAnimating()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
                print(json)
              let obj = ForgotPasswordModel(response: json)
                if obj.status ?? "" == "200" {
                    
                    DispatchQueue.main.async {
                        self.displayAlert(with: "Success", message: "Otp has been sent successfully", buttons: ["ok"]) { (str) in
                            self.navigationController?.popToRootViewController(animated: true)
                    }
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

  
