//
//  DeshboardCell.swift
//  Mansarovar
//
//  Created by Sunil Developer on 06/12/22.
//

import UIKit

class DeshboardCell: UICollectionViewCell {
    static let identifier = "DeshboardCell"

    @IBOutlet weak var lblSubName: UILabel!
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //initialSetUp()
    }

//    func initialSetUp() {
//        titleView.clipsToBounds = true
//        titleView.layer.cornerRadius = 10
//        titleView.layer.borderWidth = 3.0
//        titleView.layer.borderColor = UIColor.white.cgColor
//    }
    
}
