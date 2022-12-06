//
//  SelectClassTVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 05/12/22.
//

import UIKit

class SelectClassTVC: UITableViewCell {
    static let identifier = "SelectClassTVC"
    
    @IBOutlet weak var imgClass: UIImageView!
    
    @IBOutlet weak var lblClassName: UILabel!
    
    @IBOutlet weak var imgSelect: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
