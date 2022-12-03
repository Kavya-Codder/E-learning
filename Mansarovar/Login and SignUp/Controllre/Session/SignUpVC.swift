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
    case phone = "Please entet vaide phone"
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
    
    func initialSetUp() {
        btnSignUP.layer.cornerRadius = 20
        btnSignUP.clipsToBounds = true
        
       
    }
}
//MARK:- Custom FUnction
extension SignUpVC {
    
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
            
        } else if (txtPhone.text?.isEmpty ?? false) {
            return(false, SignUpValidation.phone.rawValue)
            
        }
        else if !self.isValidEmailAddress(txtEmail.text ?? "") {
            return (false, LoginVCValidation.vaildEmail.rawValue)
            
        }
        return(true, "")
    }
    
    func signUp() {
        let apiNmae = "https://eteachnow.com/mobile/app/user/register"
        guard let url = URL(string: apiNmae) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let param = ["instid": 31,"name": txtName.text, "email": txtEmail.text,"deviceId": "12112kkj", "password": txtPassword.text, "con_password": txtConPassword.text,"phone": txtPhone.text ] as [String : Any]
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
