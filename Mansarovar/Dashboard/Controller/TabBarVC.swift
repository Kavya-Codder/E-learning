//
//  TabBarVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 08/12/22.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
         initialStUp()
        changeUnSelectedColor()
    }
    
    func initialStUp() {
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 15
        
    }

    func changeUnSelectedColor() {
        self.tabBar.unselectedItemTintColor = UIColor.gray
    }
    
    // Tabbar
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //self.annimationWhenSelectItem(item)
    }
    
    func annimationWhenSelectItem(item: UITabBar) {
        guard let barIteamView = item.value(forKey: "view") as? UIView else {
            return
        }
        let timeInterval:TimeInterval = 0.2
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barIteamView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        propertyAnimator.addAnimations({barIteamView.transform = .identity}, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}
