//
//  LoginViewController.swift
//  Mansarovar
//
//  Created by Sunil Developer on 23/11/22.
//

import UIKit


enum LoginVCValidation: String {
    case email = "Please enter email"
    case password = "Please enter password"
    case vaildEmail = "Please entet vaide Email"
}

class LoginVC: UIViewController {
    
    @IBOutlet weak var buttomView: UIView!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInitialSetUp()
        
        let userDefault = UserDefaults.standard
        let value = userDefault.bool(forKey: UserKeys.isLoggedIn.rawValue)
        if value {
            pushToDeshboardVC()
        }
        
    }
    
    @IBAction func onClickTxtEmail(_ sender: Any) {
        lblEmail.isHidden = false
    }
    
    
    @IBAction func onClickTxtPassword(_ sender: Any) {
        lblPassword.isHidden = false
    }
    
    
    @IBAction func onClickSigiInBtn(_ sender: Any) {
        
        
        let validation = doValidation()
        if validation.0 {
            signIn()
        }else {
            showAlert(title: "Erroe", message: validation.1, hendler: nil)
        }
    }
    
    @IBAction func onClickForgotPasswordBtn(_ sender: Any) {
        pushToForgotPasswordVC()
    }
    
    
    @IBAction func onClickSignUpBtn(_ sender: Any) {
        pushToSignUpVC()
    }
}
//MARK:- Custom FUnction
extension LoginVC {
    
    func doValidation() -> (Bool, String) {
        if (txtEmail.text?.isEmpty ?? false) {
            return(false, LoginVCValidation.email.rawValue)
            
        } else if !self.isValidEmailAddress(txtEmail.text ?? "") {
            return (false, LoginVCValidation.vaildEmail.rawValue)
            
        } else if (txtPassword.text?.isEmpty ?? false) {
            return(false, LoginVCValidation.password.rawValue)
        }
        return(true, "")
    }
    
    func pushToForgotPasswordVC() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushToDeshboardVC() {
        let vc = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushToSignUpVC() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func loginInitialSetUp() {
        
        buttomView.clipsToBounds = true
        buttomView.layer.cornerRadius = 40
        buttomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        btnSignIn.clipsToBounds = true
        btnSignIn.layer.cornerRadius = 20
        
        
        
    }
    
    //MARK:- Api call
    
    func signIn() {
        self.startAnimation()
        let param = ["instid": 20, "email": txtEmail.text ?? "", "password": txtPassword.text ?? ""] as [String : Any]
        ApiManager.networdRequest(requestType: HttpRequestType.POST, apiUrl: ApiManager.logIn, inputParam: param) { (jsonResponse, error, success) in
            self.stopAnimating()
            if success  { // success == true
                if let response = jsonResponse {
                    let obj = LoginModel(response: response)
                    DispatchQueue.main.async {
                        
                        self.displayAlert(with: "Success", message: "Login Successfully", buttons: ["ok"]) { (str) in
                            UserDefaults.saveUserVales(user: obj, isLoggedIn: true )
                            self.pushToDeshboardVC()
                            
                        }
                    }
                }
                
            }
            
        }
        
       
    }
    
}



