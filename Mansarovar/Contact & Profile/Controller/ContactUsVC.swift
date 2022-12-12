//
//  ContactUsVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import UIKit

class ContactUsVC: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnMail: UIButton!
    
    @IBOutlet weak var txtName: UITextField!
   
    @IBOutlet weak var txtMsg: UITextView!
    
    @IBOutlet weak var btnSendMessage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }
    


}
extension ContactUsVC {
    
    func initialSetup() {
        viewContainer.clipsToBounds = true
        viewContainer.layer.cornerRadius = 25
        
        btnSendMessage.clipsToBounds = true
        btnSendMessage.layer.cornerRadius = 15
        
        txtName.clipsToBounds = true
        txtName.layer.cornerRadius = 10
        txtName.layer.borderWidth = 1.0
        txtName.layer.borderColor = UIColor(named: "loginButton")?.cgColor
        
        txtMsg.clipsToBounds = true
        txtMsg.layer.cornerRadius = 10
        txtMsg.layer.borderWidth = 1.0
        txtMsg.layer.borderColor = UIColor(named: "loginButton")?.cgColor
        
        viewContainer.clipsToBounds = true
        viewContainer.layer.cornerRadius = 40
        viewContainer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
}
