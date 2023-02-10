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
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
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
        let param = ["instid": 20, "email": txtEmail.text ?? ""] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.forgotPassword, inputParam: param) { (jsonResponse, error, success) in
            self.stopAnimating()
            if success {
                if let response = jsonResponse {
                    let obj = ForgotPasswordModel(response: response)
                    DispatchQueue.main.async {
                        self.displayAlert(with: "Success", message: "Otp has been sent successfully", buttons: ["ok"]) { (str) in
                            self.navigationController?.popToRootViewController(animated: true)
                        }
                    }
                }
            }
        }
    }
}


