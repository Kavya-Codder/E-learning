//
//  TestSeriesCell.swift
//  Mansarovar
//
//  Created by Sunil Developer on 03/12/22.
//

import UIKit

class TestSeriesCell: UICollectionViewCell {
     static let identifier = "TestSeriesCell"

    @IBOutlet weak var imgTestSeries: UIImageView!
    @IBOutlet weak var lblTestSeriesTitle: UILabel!
    @IBOutlet weak var lblNoOfTest: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
