//
//  AlertView.swift
//  Mansarovar
//
//  Created by Sunil Developer on 02/12/22.
//

import Foundation
import UIKit
extension UIViewController {
    func showAlert(title: String, message: String, hendler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default , handler: hendler)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    // MARK: - Email Validations
     func isValidEmailAddress(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

