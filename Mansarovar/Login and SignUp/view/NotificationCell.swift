//
//  NotificationCell.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import UIKit

class NotificationCell: UITableViewCell {
    static let identifier = "NotificationCell"
    
    @IBOutlet weak var imgNotification: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgNotification.layer.cornerRadius = 25
        imgNotification.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
