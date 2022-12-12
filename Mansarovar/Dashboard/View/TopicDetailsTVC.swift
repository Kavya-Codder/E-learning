//
//  TopicDetailsTVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import UIKit

class TopicDetailsTVC: UITableViewCell {
    static let identifier = "TopicDetailsTVC"
    
    @IBOutlet weak var imgSub: UIImageView!
    @IBOutlet weak var lblCourseTitle: UILabel!
    @IBOutlet weak var lblE_Count: UILabel!
    @IBOutlet weak var lblT_Count: UILabel!
    @IBOutlet weak var lblV_Count: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
