//
//  TestCell.swift
//  Mansarovar
//
//  Created by Sunil Developer on 25/12/22.
//

import UIKit

class TestCell: UITableViewCell {
    static let identifier = "TestCell"

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewNumber: UIView!
    @IBOutlet weak var lblOptions: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialSetup() {
        viewContainer.clipsToBounds = true
        viewContainer.layer.cornerRadius = 15
        viewContainer.layer.borderWidth = 1.0
        viewContainer.layer.borderColor = UIColor.black.cgColor
        
        viewNumber.clipsToBounds = true
        viewNumber.layer.cornerRadius = 12.5
    }
    
}
