//
//  Group.swift
//  Assessment6
//
//  Created by Drew Seeholzer on 7/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation

class Group: Codable {
    var group: Pair
    init(group: Pair) {
        self.group = group
    }
}
