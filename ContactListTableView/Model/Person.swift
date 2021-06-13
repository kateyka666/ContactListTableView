//
//  Person.swift
//  ContactListTableView
//
//  Created by Екатерина Боровкова on 12.06.2021.
//



struct Person {
    var name : String
    var surname : String
    var phone : String
   var email : String
    
    var fullName : String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func makePersons() -> [Person] {
        var index = 0
        var arrayOfPerson :[Person] = []
//        одиннадцать раз кладем в массив персон новую персону, при этом каждый раз увлеичиваем индекс, чтобы брать всегда новое значение
        for _ in 0...10 {
            arrayOfPerson.append(Person(
                                    name: DataManager.shared.names[index],
                                    surname: DataManager.shared.surnames[index],
                                    phone: DataManager.shared.phones[index],
                                    email: DataManager.shared.emails[index]))
            index += 1
          
        }
        return arrayOfPerson
}
}
