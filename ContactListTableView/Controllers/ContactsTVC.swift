//
//  ContactsTVC.swift
//  ContactListTableView
//
//  Created by Екатерина Боровкова on 12.06.2021.
//

import UIKit


class ContactsTVC: UITableViewController {
   
    var person : [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return person.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return person[section].fullName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let currentPerson = person[indexPath.section]
        var content = cell.defaultContentConfiguration()
        if (indexPath.row % 2 == 0) {
            content.text = currentPerson.phone
            content.image = UIImage(systemName: "phone.circle.fill")
        } else {
            content.text = currentPerson.email
            content.image = UIImage(systemName: "envelope.fill")
        }
        cell.contentConfiguration = content
        return cell
    }
}
