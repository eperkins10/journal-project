//
//  JournalListViewController.swift
//  Journal
//
//  Created by Ethan Perkins on 11/17/21.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var journalListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        journalListTableView.delegate = self
        journalListTableView.dataSource = self
        
    }
    
    @IBAction func createNewJournalButtonTapped(_ sender: Any) {
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
