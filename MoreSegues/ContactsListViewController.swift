//
//  ContactsListViewController.swift
//  MoreSegues
//
//  Created by mac on 5/10/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
    var contact: Contact?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailContactSegue" {
            if let detaiViewController = segue.destination as? DetailContactViewController {
                detaiViewController.contact = contact
            }
        } else if segue.identifier == "popoverSegue" {
            if let detaiViewController = segue.destination as? DetailContactViewController {
                detaiViewController.contact = myContact
                if let ppc = detaiViewController.popoverPresentationController {
                    ppc.delegate = self
                }
            }
        }
    }

    
    @IBAction func goBack(segue: UIStoryboardSegue) {
       tableView?.reloadData()
    }
    
    var contacts: [Contact] = [
        Contact(image: nil, name: "John", phone: "(888) 555 5512"),
        Contact(image: nil, name: "Kate", phone: "(888) 123 5412")
    ]
    
    var myContact: Contact = Contact(image: nil, name: "Irina", phone: "(111) 333 1234")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let chosenCell = tableView.cellForRow(at: indexPath)! as? UITableViewCell {
            contact = contacts[indexPath.row]
            performSegue(withIdentifier: "DetailContactSegue", sender: chosenCell)
        }
    }
    
 
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    @IBOutlet weak var tableView: UITableView?
}
