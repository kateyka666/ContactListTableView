//
//  DataManager.swift
//  ContactListTableView
//
//  Created by Екатерина Боровкова on 12.06.2021.
//



class DataManager {
    
//    делаем синглтон для доступа к данным класса
    static let shared = DataManager()
    
    var names : [String] = ["Vladimir","Aleksander","Sergei","Dmitriy","Petr","Mikhail","Igor","Aleksei"," Ivan","Victor","Konstantin"].shuffled()
    var surnames : [String] = ["Medvedev", "Yeremin", "Putin", "Hasymov", "Zhirnov", "Bravy", "Shalyapin", "Kukushkin", "Raykin", "Rodnoy", "Pushkin"].shuffled()
    var phones = ["+79919696592","+79998861121","+79631393158","+79779151379","+79015047084","+79919651775","+79632289106","+79639655135","+79309471609","+79677442400","+79309446670"].shuffled()
    var emails = ["gocoh98830@bbsaili.com","hedrajulme@biyac.com","jopsacumla@biyac.com","sagnacospa@biyac.com","sertamagna@biyac.com","histonumla@biyac.com","purdojaspi@yevme.com","homlayomlo@yevme.com","vitrivumli@yevme.com","ritrilirko@yevme.com","birkomafyi@yevme.com"].shuffled()
}
