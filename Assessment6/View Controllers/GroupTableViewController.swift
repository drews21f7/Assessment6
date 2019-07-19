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
        PairController.sharedInstance.createGroup()

    }
    
    // MARK: - Buttons
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let group = PairController.sharedInstance.groups[PairController.sharedInstance.groups.count - 1]
        if group.groupPair.count < 2 {
            alertControllerGroupCanBeFilled(group: group)
        } else if group.groupPair.count == 2 {
            alertControllerNewGroup()
        }
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PairController.sharedInstance.groups.count * 3
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groupCell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupTableViewCell else { return UITableViewCell() }
        guard let name1Cell = tableView.dequeueReusableCell(withIdentifier: "name1Cell", for: indexPath) as? GroupTableViewCell else { return UITableViewCell() }
        guard let name2Cell = tableView.dequeueReusableCell(withIdentifier: "name2Cell", for: indexPath) as? GroupTableViewCell else { return UITableViewCell() }
        
        //TODO: - Make names optional to prevent index error from group only having 1 name
        //let group = PairController.sharedInstance.groups[indexPath.row]
        let name1 = PairController.sharedInstance.groups[indexPath.row].groupPair[0]
        let name2 = PairController.sharedInstance.groups[indexPath.row].groupPair[1]
        
        //TODO: - Find way to number each group
        groupCell.groupLabel?.text = "Group"
        name1Cell.name1Label?.text = name1.name
        name2Cell.name2Label?.text = name2.name


        return groupCell; name1Cell; name2Cell
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
