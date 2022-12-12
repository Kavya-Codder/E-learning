//
//  ProfileTVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 12/12/22.
//

import UIKit

class ProfileTVC: UITableViewCell {
static let identifier = "ProfileTVC"

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgList: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
