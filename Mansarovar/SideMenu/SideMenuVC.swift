//
//  SideMenuVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 15/12/22.
//

import UIKit
import SideMenu


class SideMenuVC: UIViewController {

    @IBOutlet weak var contenerView: UIView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewImgBG: UIView!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var lblProfileName: UILabel!
    
    @IBOutlet weak var lblProfileEmail: UILabel!
    var isSideViewOpen: Bool = false
   // var arrData = ["Home", "Select Class", "Educator", "Profile", "Contact", "LogOut"]
   
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
//       tableView.delegate = self
//        tableView.register(UINib(nibName: SideMenu.identifier, bundle: nil), forCellReuseIdentifier: SideMenu.identifier)
        
        menu = SideMenuNavigationController(rootViewController: ListController())
        menu?.leftSide = true
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        SideMenuManager.default.leftMenuNavigationController = menu
        menu?.setNavigationBarHidden(true, animated: true)
        
        
    }
    
    @IBAction func onClickMenuBtn(_ sender: Any) {
        
        present(menu!, animated: true, completion: nil)
    }
        
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
//            self.view.frame.origin.x = -self.view.bounds.size.width
//            self.menuBackDelegate?.back(index: 0)
//        }, completion: { _ in
//            self.willMove(toParent: nil)
//            self.view.removeFromSuperview()
//            self.removeFromParent()
//        })
//        contenerView.isHidden = false
//        tableView.isHidden = false
//        self.view.bringSubviewToFront(contenerView)
//        if !isSideViewOpen {
//            isSideViewOpen = true
//            contenerView.frame = CGRect(x: 0, y: 80, width: 0, height: 816)
//            tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 816)
//            UIView.setAnimationDuration(0.3)
//            UIView.setAnimationDelegate(self)
//            UIView.beginAnimations("TableAnimation", context: nil)
//
//
//            contenerView.frame = CGRect(x: 0, y: 80, width: 300, height: 816)
//            tableView.frame = CGRect(x: 0, y: 0, width: 300, height: 816)
//            UIView.commitAnimations()
//        } else {
//            contenerView.isHidden = true
//            tableView.isHidden = true
//            isSideViewOpen = false
//            contenerView.frame = CGRect(x: 0, y: 80, width: 300, height: 816)
//            tableView.frame = CGRect(x: 0, y: 0, width: 300, height: 816)
//            UIView.setAnimationDuration(0.3)
//            UIView.setAnimationDelegate(self)
//            UIView.beginAnimations("TableAnimation", context: nil)
//
//            contenerView.frame = CGRect(x: 0, y: 80, width: 0, height: 816)
//            tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 816)
//            UIView.commitAnimations()
//        }
//
//
  //  }

}
//MARK:- TableView Delegate and datasoure

//extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenu.identifier, for: indexPath) as! SideMenu
//        let sObj = arrData[indexPath.row]
//        cell.lblTitle.text = sObj
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        switch indexPath.row {
//        //Deshboard vc
//        case 0:
//        let deshboardVC = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DeshboardVC") as! DeshboardVC
//        navigationController?.pushViewController(deshboardVC, animated: true)
//            break
//        //Select Class vc
//        case 1:
//        let selectClassVC = UIStoryboard(name: "SelectClass", bundle: nil).instantiateViewController(withIdentifier: "SelectClassVC") as! SelectClassVC
//        navigationController?.pushViewController(selectClassVC, animated: true)
//            break
//            // Eduvator vc
//        case 2:
//            let educatorVC = UIStoryboard(name: "Educator", bundle: nil).instantiateViewController(withIdentifier: "EducatorVC") as! EducatorVC
//            navigationController?.pushViewController(educatorVC, animated: true)
//        // Profile vc
//    case 3:
//        let profileVC = UIStoryboard(name: "Contact & Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//        navigationController?.pushViewController(profileVC, animated: true)
//        // Contact vc
//    case 4:
//        let contactVC = UIStoryboard(name: "Contact & Profile", bundle: nil).instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
//        navigationController?.pushViewController(contactVC, animated: true)
//        default:
//            break
//        }
//   }
//
//}
//
//
