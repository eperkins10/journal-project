//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Ethan Perkins on 11/15/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        EntryController.shared.loadFromPersistentStorage()

    }
    
    
    
    @IBAction func clearFieldsTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty else { return }
        
                
        if entry != nil {
            print("to be implemented tomorrow")
        } else {
            EntryController.shared.createEntryWith(title: title, body: body)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title 
        bodyTextField.text = entry.body
        
              
        
    }
    

}
