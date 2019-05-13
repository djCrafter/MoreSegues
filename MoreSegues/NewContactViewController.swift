//
//  NewContactViewController.swift
//  MoreSegues
//
//  Created by mac on 5/10/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    var newContact: Contact? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
    
    func fillContact(){
        newContact = Contact(image: avatarImageView?.image, name: nameTextField?.text, phone: phoneTextField?.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        fillContact()
        if newContact != nil {
        var destVC = segue.destination as! ContactsListViewController
            destVC.contacts.append(newContact!)
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView?
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var phoneTextField: UITextField?
}
