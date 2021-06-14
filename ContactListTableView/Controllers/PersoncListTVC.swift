//
//  PersoncListTVC.swift
//  ContactListTableView
//
//  Created by Екатерина Боровкова on 13.06.2021.
//

import UIKit

class PersoncListTVC: UITableViewController {
    
    private var person = Person.makePersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        tabBarController?.delegate = self
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return person.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalCell", for: indexPath)
        let currentPerson = person[indexPath.section]
        cell.textLabel!.text = currentPerson.fullName
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return  .delete
    }
    
    //    метод для удаления персоны из массива и удаления секции из тейблвью
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        person.remove(at: indexPath.section)
        tableView.deleteSections(IndexSet(arrayLiteral: indexPath.section), with: .fade)
    }
    
    //    метод для перемещения секций
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //        удаляем персону по выбранному номеру секции
        let deletedPerson = person.remove(at: sourceIndexPath.section)
        //        вставляем удаленную персону по выбранному после перемещения номеру секции
        person.insert(deletedPerson, at: destinationIndexPath.section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oneVC" {
            guard let onePersonVC = segue.destination as? OnePersonVC, let indexPath = tableView.indexPathForSelectedRow else {return}
            let person = person[indexPath.section]
            onePersonVC.person = person
        }
    }
}
extension PersoncListTVC : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController == tabBarController.viewControllers![1] {
            let navController = tabBarController.viewControllers![1] as? UINavigationController
            let contactsTVC = navController?.topViewController as! ContactsTVC
            contactsTVC.person = person
        }
    }
}
