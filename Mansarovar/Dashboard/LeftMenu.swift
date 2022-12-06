//
//  LeftMenu.swift
//  Mansarovar
//
//  Created by Sunil Developer on 05/12/22.
//

import UIKit

class LeftMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 80
    }
    
}
