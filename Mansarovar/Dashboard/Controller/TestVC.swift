//
//  TestVC.swift
//  Mansarovar
//
//  Created by Sunil Developer on 24/12/22.
//

import UIKit

class TestVC: UIViewController {
    
    @IBOutlet weak var btnShowQues: UIButton!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblQuesNo: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var optionsTV: UITableView!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()

        optionsTV.delegate = self
        optionsTV.dataSource = self
        optionsTV.register(UINib(nibName: TestCell.identifier, bundle: nil), forCellReuseIdentifier: TestCell.identifier)
        
    }
    
}

// Extension

extension TestVC: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = optionsTV.dequeueReusableCell(withIdentifier: TestCell.identifier) as! TestCell
        cell.lblNumber.text = "\(indexPath.row + 1)"
        return cell
    
    }
    
    func initialSetup() {
        btnPrev.clipsToBounds = true
        btnPrev.layer.cornerRadius = 15
        
        btnNext.clipsToBounds = true
        btnNext.layer.cornerRadius = 15
        
        btnShowQues.clipsToBounds = true
        btnShowQues.layer.cornerRadius = 15
        btnShowQues.layer.borderWidth = 1.0
        btnShowQues.layer.borderColor = UIColor.white.cgColor
        
    }
    
}
