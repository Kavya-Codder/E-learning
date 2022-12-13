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
    
    @IBOutlet weak var profileTableView: UITableView!
    
    @IBOutlet weak var viewContainer: UIView!
    
    var arrProfile: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        
        if let name = UserDefaults.standard.value(forKey: UserKeys.name.rawValue) as? String {
            lblPName.text = name.capitalized
        }
        if let email = UserDefaults.standard.value(forKey: UserKeys.email.rawValue) as? String {
            lblEmail.text = email.capitalized
        }
    }
    
    func initialSetUp() {
        imgProfile.clipsToBounds = true
        imgProfile.layer.cornerRadius = 37.5
        
    }
    
}
