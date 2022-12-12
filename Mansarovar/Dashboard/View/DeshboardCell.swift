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
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var titleView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.backgroundColor = generateRandomColor()
        //initialSetUp()
    }

//    func initialSetUp() {
//        titleView.clipsToBounds = true
//        titleView.layer.cornerRadius = 10
//        titleView.layer.borderWidth = 3.0
//        titleView.layer.borderColor = UIColor.white.cgColor
//    }
    
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        return randomColor
    }
}
