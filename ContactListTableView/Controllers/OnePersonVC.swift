//
//  OnePersonVC.swift
//  ContactListTableView
//
//  Created by Екатерина Боровкова on 13.06.2021.
//

import UIKit

class OnePersonVC: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLabels()
    }
}

extension OnePersonVC {
    
    private func makeLabels() {
        fullNameLabel.text = person.fullName
        fullNameLabel.font = UIFont(name: "futura", size: 25)
        phoneLabel.text = "Phone: \(person.phone)"
        emailLabel.text = "Email: \(person.email)"
    }
    
}
