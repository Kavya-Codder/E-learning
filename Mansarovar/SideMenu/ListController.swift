//
//  ListController.swift
//  Mansarovar
//
//  Created by Sunil Developer on 16/12/22.
//

import UIKit


class ListController: UITableViewController {
    var arrData = ["Home", "Select Class", "Educator", "Profile", "Contact", "LogOut"]
    var arrImg = ["sHome", "sClass", "sEducator", "sUser", "sPhone", "sLogout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView.backgroundColor = UIColor.init(named: "loginButton")
        
        
        tableView.separatorStyle = .none
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 100))
        let imageView = UIImageView(frame: CGRect(x: 20, y: 30, width: 50, height: 50))
        imageView.image = UIImage(named: "man")
        headerView.addSubview(imageView)
        let name = UILabel(frame: CGRect(x: 80, y: 35, width: 200, height: 30))
            let pName = UserDefaults.standard.value(forKey: UserKeys.name.rawValue) as? String
        name.text = pName
        name.textColor = UIColor.white
        name.font = .boldSystemFont(ofSize: 20.0)
        headerView.addSubview(name)
        let view = UIView(frame: CGRect(x: 0, y: 100, width: 240 , height: 2))
        view.backgroundColor = UIColor.gray
        headerView.addSubview(view)
        self.tableView.tableHeaderView = headerView

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let sObj = arrData[indexPath.row]
            cell.textLabel?.text = sObj
        cell.backgroundColor = UIColor.init(named: "loginButton")
        cell.textLabel?.textColor = UIColor.white
//        let imgObj = arrImg[indexPath.row]
//
//        cell.imageView?.image = UIImage(named: imgObj)
        
            return cell
        }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
                //Deshboard vc
                case 0:
                let deshboardVC = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DeshboardVC") as! DeshboardVC
                navigationController?.pushViewController(deshboardVC, animated: true)
                    break
                //Select Class vc
                case 1:
                let selectClassVC = UIStoryboard(name: "SelectClass", bundle: nil).instantiateViewController(withIdentifier: "SelectClassVC") as! SelectClassVC
                navigationController?.pushViewController(selectClassVC, animated: true)
                    break
                    // Eduvator vc
                case 2:
                    let educatorVC = UIStoryboard(name: "Educator", bundle: nil).instantiateViewController(withIdentifier: "EducatorVC") as! EducatorVC
                    navigationController?.pushViewController(educatorVC, animated: true)
                // Profile vc
            case 3:
                let profileVC = UIStoryboard(name: "Contact & Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                navigationController?.pushViewController(profileVC, animated: true)
                // Contact vc
            case 4:
                let contactVC = UIStoryboard(name: "Contact & Profile", bundle: nil).instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
                navigationController?.pushViewController(contactVC, animated: true)
        // logout
        
        case 5:
           let Alertobj = UIAlertController(title: title, message: "Do you want to Logout", preferredStyle: UIAlertController.Style.alert)
           let ok = UIAlertAction(title: "YES", style: .default) { (UIAlertAction) in
         // UserDefaults.standard.removeObject(forKey: UserKeys.isLoggedIn.rawValue)
            UserDefaults.standard.setValue("false", forKey: UserKeys.isLoggedIn.rawValue)

                let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                self.navigationController?.pushViewController(loginVC, animated: true)
             }
           let no = UIAlertAction(title: "NO", style: .cancel) { (UIAlertAction) in

            }
             Alertobj.addAction(no)
             Alertobj.addAction(ok)
             self.present(Alertobj, animated: true, completion: nil)
           break;
        default:
            break
           }
    }
    }

