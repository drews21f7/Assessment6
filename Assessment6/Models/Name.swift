//
//  Name.swift
//  Assessment6
//
//  Created by Drew Seeholzer on 7/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation

//class Name: Pair {
//    var name: String
//    init(name: String, pair: [Name], group: Pair) {
//        self.name = name
//        super.init(pair: pair, group: group)
//    }

class Name: Codable {
    var name: String
    init(name:String) {
        self.name = name
    
    }
}
