//
//  ProfileVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var lblPName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmailID: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    
    var arrProfile: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        
        if let name = UserDefaults.standard.value(forKey: UserKeys.name.rawValue) as? String {
            lblPName.text = name.capitalized
            lblName.text = name
        }
        if let email = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String {
            lblEmail.text = email
            lblEmailID.text = email
        }
        if let phone = UserDefaults.standard.value(forKey: UserKeys.phone.rawValue) as? String {
            lblPhone.text = phone
        }
    }
    
    func initialSetUp() {
        imgProfile.clipsToBounds = true
        imgProfile.layer.cornerRadius = 37.5
        
    }
    
}
