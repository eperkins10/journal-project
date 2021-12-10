//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Ethan Perkins on 11/15/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return journal?.entries.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        guard let journal = journal else { return cell }
        
        cell.textLabel?.text = journal.title
        
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let journal = journal else { return }
            let entryToDelete = journal.entries[indexPath.row]
            EntryController.shared.deleteEntry(entry: entryToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editEntry" {
            guard let index = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController else { return }
            
            let entry = EntryController.shared.entries[index.row]
            destination.entry = entry
            
        }
    }

}
