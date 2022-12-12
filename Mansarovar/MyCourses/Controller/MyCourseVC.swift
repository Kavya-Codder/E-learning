//
//  MyCourseVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import UIKit

class MyCourseVC: UIViewController {
    

    @IBOutlet weak var lblPleaseBrowse: UILabel!
    @IBOutlet weak var lblNoCourse: UILabel!
    @IBOutlet weak var btnBrowse: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetUp()
    }
    
    func initialSetUp() {
        btnBrowse.clipsToBounds = true
        btnBrowse.layer.cornerRadius = 10
        
    }

}
