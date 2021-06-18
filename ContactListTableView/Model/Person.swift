//
//  Person.swift
//  ContactListTableView
//
//  Created by Екатерина Боровкова on 12.06.2021.
//



struct Person {
    var name: String
    var surname: String
    var phone: String
   var email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func makePersons() -> [Person] {
        var index = 0
        var arrayOfPerson: [Person] = []
        
//       находим минимальное число элементов в массивах для создания масива персонз определенное число раз
        let repetingCount = min(DataManager.shared.names.count, DataManager.shared.surnames.count, DataManager.shared.phones.count, DataManager.shared.emails.count) - 1
        
//        одиннадцать раз кладем в массив персон новую персону, при этом каждый раз увлеичиваем индекс, чтобы брать всегда новое значение
        for _ in 0...repetingCount {
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
