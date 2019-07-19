//
//  PairController.swift
//  Assessment6
//
//  Created by Drew Seeholzer on 7/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation

class PairController {
    
    var sharedInstance = PairController()
    
    var groups: [Group] = []
    
    var pairs: [Pair] = []
    
    // MARK: - CRUD
    
//    func createGroup() {
//        let group = Group.init(group: [])
//        groups.append(group)
//    }
//
//    func addNameToGroup(group: [Group], name: String) {
//        let group = Group.init(group: group)
//    }
    
    
    
    
    // MARK: - Persistence
    
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedGroups = try jsonDecoder.decode([Group].self, from: data)
            groups = decodedGroups
        } catch let error {
            print ("Error loading from persistent store: \(error.localizedDescription)")
        }
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedPairs = try jsonDecoder.decode([Pair].self, from: data)
            pairs = decodedPairs
        } catch let error {
            print ("Error loading from persistent store: \(error.localizedDescription)")
        }
    }
    
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        
        do {
            let data = try jsonEncoder.encode(groups)
            try data.write(to: fileURL())
        } catch let error {
            print ("Error saving to persistent store: \(error.localizedDescription)")
        }
        
        do {
            let data = try jsonEncoder.encode(pairs)
            try data.write(to: fileURL())
        } catch let error {
            print ("Error saving to persistent store: \(error.localizedDescription)")
        }
    }
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "Assessment6.json"
        let url = documentDirectory.appendingPathComponent(fileName)
        return url
    }
}
