//
//  OnePersonVC.swift
//  ContactListTableView
//
//  Created by Екатерина Боровкова on 13.06.2021.
//

import UIKit
import MessageUI

class OnePersonVC: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    
    var person: Person!
    
    //создаем контроллер для отправки письма
    var mailVC = MFMailComposeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLabelsAndButtons()
     
        mailVC.mailComposeDelegate = self
        print("32b830353654674444444444576741c")
    }
    
    @IBAction func phonaBtnPressed() {
        call()
    }
    
    @IBAction func emailBtnPressed() {
        emailSend()
    }
    
}

extension OnePersonVC {
    
    private func makeLabelsAndButtons() {
        fullNameLabel.text = person.fullName
        fullNameLabel.font = UIFont(name: "futura", size: 25)
        
        phoneBtn.setTitle("Phone: \(person.phone)", for: .normal)
        emailBtn.setTitle("Email: \(person.email)", for: .normal)
        
    }
    
    //    метод для вызова номера телефона
    private func call() {
        let url = URL(string: "tel://\(person.phone)")!
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(url)) {
            application.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func emailSend(){
        //        назначаем кому слать пимьсо
        mailVC.setToRecipients([person.email])
        //        добавляем мейлконтроллер на главный контроллер
        present(mailVC, animated: true, completion: nil)
    }
}

extension OnePersonVC : MFMailComposeViewControllerDelegate {
    //    пытаемся делать обработчик для действий с письмом)
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("cancelled")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        case .failed:
            print("failed")
        default:
            break
        }
    }
    
}
