//
//  Person.swift
//  GenericTableView
//
//  Created by Artem Lyksa on 2/28/19.
//  Copyright © 2019 lyksa. All rights reserved.
//

import Foundation

struct Person {
    
    let name: String
    
    static var stubPersons: [Person] {
        return [
            Person(name: "Mark Hamill"),
            Person(name: "Harrison Ford"),
            Person(name: "Carrie Fisher"),
            Person(name: "Hayden Christensen"),
            Person(name: "Ewan McGregor"),
            Person(name: "Natalie Portman"),
            Person(name: "Liam Neeson")
        ]
    }
}
