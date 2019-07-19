//
//  GroupTableViewController.swift
//  Assessment6
//
//  Created by Drew Seeholzer on 7/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class GroupTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PairController.sharedInstance.groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
    func alertControllerNewGroup() {
        let alertController = UIAlertController(title: "Add Person", message: "Add new person to list", preferredStyle: .alert)
        alertController.addTextField { (_) in
            
        }
        let addPerson = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let personName = alertController.textFields?[0].text else { return }
            PairController.sharedInstance.createGroup()
            let newGroup = PairController.sharedInstance.groups[PairController.sharedInstance.groups.count - 1]
            PairController.sharedInstance.addName(group: newGroup, name: personName)
        }
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(addPerson)
        alertController.addAction(cancelAlert)
        
        present(alertController, animated: true)
    }
    
    func alertControllerGroupCanBeFilled(group: Group) {
        let alertController = UIAlertController(title: "Add Person", message: "Add new person to list", preferredStyle: .alert)
        alertController.addTextField { (_) in
            
        }
        let addPerson = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let personName = alertController.textFields?[0].text else { return }
            PairController.sharedInstance.addName(group: group, name: personName)
        }
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(addPerson)
        alertController.addAction(cancelAlert)
        
        present(alertController, animated: true)
    }


   


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}
