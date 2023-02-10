//
//  PlanTestTVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import UIKit

class PlanTestTVC: UITableViewCell {
    static let identifier = "PlanTestTVC"
    
    @IBOutlet weak var lbltest: UILabel!
    @IBOutlet weak var lblMarks: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
