//
//  SignUpVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 02/12/22.
//

import UIKit

enum SignUpValidation: String {
    case name = "Please enter name"
    case email = "Please enter email"
    case password = "Please enter password"
    case con_Password = "Please conferm password"
    case passwordMatch = "Password does not match"
    case phone = "Please entet phone no."
    case phonev1 = "Mobile number should be greater than or equal to 10 digits"
    case phonev2 = "Please entet vaide phone no"
}

class SignUpVC: UIViewController {

    @IBOutlet weak var btnSignUP: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConPassword: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblConPassword: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetUp()
    }
    
    @IBAction func onClickTxtName(_ sender: Any) {
        lblName.isHidden = false
    }
    
    @IBAction func onClickTxtEmail(_ sender: Any) {
        lblEmail.isHidden = false
    }
    
    @IBAction func onClickTxtPassword(_ sender: Any) {
        lblPassword.isHidden = false
    }
    
    @IBAction func onClickTxtConPassword(_ sender: Any) {
        lblConPassword.isHidden = false
    }
    
    @IBAction func onClickTxtPhone(_ sender: Any) {
        lblPhone.isHidden = false
    }
    
    @IBAction func onClickSignUp(_ sender: Any) {
        let validation = doValidation()
        if validation.0 {
            signUp()
        } else
        {
            showAlert(title: "Error", message: validation.1, hendler: nil)
        }
    }
    
    @IBAction func onClickSignInBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
//MARK:- Custom FUnction
extension SignUpVC {
    
    func initialSetUp() {
        btnSignUP.layer.cornerRadius = 20
        btnSignUP.clipsToBounds = true
        
       
    }
    
    func doValidation() -> (Bool, String) {
        if (txtName.text?.isEmpty ?? false) {
             return(false, SignUpValidation.name.rawValue)
             
         }
       else if (txtEmail.text?.isEmpty ?? false) {
            return(false, SignUpValidation.email.rawValue)
            
        } else if (txtPassword.text?.isEmpty ?? false) {
            return(false, SignUpValidation.password.rawValue)
            
        } else if (txtConPassword.text?.isEmpty ?? false) {
            return(false, SignUpValidation.con_Password.rawValue)
            
        } else if (txtConPassword.text != txtPassword.text) {
            return(false, SignUpValidation.passwordMatch.rawValue)

        }else if (txtPhone.text?.isEmpty ?? false) {
            return(false, SignUpValidation.phone.rawValue)
            
        } else if (txtPhone.text?.count ?? 0 < 9) {
            return(false, SignUpValidation.phonev1.rawValue)
            
        } else if (txtPhone.text?.count ?? 0 > 10) {
            return(false, SignUpValidation.phonev2.rawValue)
            
        }
        else if !self.isValidEmailAddress(txtEmail.text ?? "") {
            return (false, LoginVCValidation.vaildEmail.rawValue)
            
        }
        return(true, "")
    }
    
    func signUp() {
        self.startAnimation()
        let apiNmae = "https://eteachnow.com/mobile/app/user/register"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = ["instid": 31,"name": txtName.text ?? "", "email": txtEmail.text ?? "","deviceId": "12112kkj", "password": txtPassword.text ?? "", "password_again": txtConPassword.text ?? "","phone": txtPhone.text ?? ""] as [String : Any]
        print(param)
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.stopAnimating()

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! Dictionary<String, Any>
               print(json)
               let obj = LoginModel(response: json)
                if obj.status ?? "" == "200" {
                    
                    DispatchQueue.main.async {
                        self.displayAlert(with: "Success", message: "You have been registered successfully", buttons: ["ok"]) { (str) in
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
