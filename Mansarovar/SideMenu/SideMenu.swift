//
//  SideMenu.swift
//  Mansarovar
//
//  Created by Sunil Developer on 16/12/22.
//

import UIKit

class SideMenu: UITableViewCell {
    static let identifier = "SideMenu"
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var sideImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
