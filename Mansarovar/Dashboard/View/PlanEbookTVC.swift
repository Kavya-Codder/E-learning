//
//  PlanEbookTVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 09/12/22.
//

import UIKit

class PlanEbookTVC: UITableViewCell {
static let identifier = "PlanEbookTVC"
    
    @IBOutlet weak var lblBook: UILabel!
    @IBOutlet weak var lblMarks: UILabel!
    
    @IBOutlet weak var lblNoOfQues: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
