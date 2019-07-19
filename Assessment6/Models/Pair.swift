//
//  Pair.swift
//  Assessment6
//
//  Created by Drew Seeholzer on 7/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation

class Pair: Group {
    var name: String
    init(name: String, group: [Pair]) {
        self.name = name
        super.init(group: group)
    }
}
