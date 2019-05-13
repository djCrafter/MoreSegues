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
        
    }
    
    func fillContact(){
        newContact = Contact(image: avatarImageView?.image, name: nameTextField?.text, phone: phoneTextField?.text)
    }
    
    @IBOutlet weak var avatarImageView: UIImageView?
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var phoneTextField: UITextField?
}
