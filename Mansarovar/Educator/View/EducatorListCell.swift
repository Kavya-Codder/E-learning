//
//  EducatoeListCell.swift
//  Mansarovar
//
//  Created by Sunil Developer on 10/12/22.
//

import UIKit

class EducatorListCell: UICollectionViewCell {
static let identifier = "EducatorListCell"
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var imgEducator: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContainer.backgroundColor = UIColor.white
        
    }

    func generateRandomColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        return randomColor
    }
}
