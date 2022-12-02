//
//  LoginViewController.swift
//  Mansarovar
//
//  Created by Sunil Developer on 23/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var buttomView: UIView!
    
    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginInitialSetUp()
        
    }
    func loginInitialSetUp() {
//        topView.clipsToBounds = true
//        topView.layer.cornerRadius = 40
//        topView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        buttomView.clipsToBounds = true
        buttomView.layer.cornerRadius = 40
        buttomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        btnSignIn.clipsToBounds = true
        btnSignIn.layer.cornerRadius = 20
        
        
    }
   
}
