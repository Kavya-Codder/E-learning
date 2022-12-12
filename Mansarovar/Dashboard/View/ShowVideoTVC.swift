//
//  ShowVideoTVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import UIKit

class ShowVideoTVC: UITableViewCell {
    static let identifier = "ShowVideoTVC"

    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
