//
//  AddStudentViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/14/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    
    @IBAction func addBtnTapped(_ sender: AnyObject) {
        if let nv = self.navigationController {
            _ = DataManager.addStudent(self.firstName.text!, self.lastName.text!, Int(self.age.text!)!)
            nv.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.isEnabled = false
        firstName.addTarget(self, action:#selector(fieldChange), for: UIControlEvents.editingChanged)
        lastName.addTarget(self, action:#selector(fieldChange), for: UIControlEvents.editingChanged)
        age.addTarget(self, action:#selector(fieldChange), for: UIControlEvents.editingChanged)
    }
    
    func fieldChange(textField: UITextField) {
        let firstNameText = (firstName.text ?? "").trimmingCharacters(in: .whitespaces)
        let lastNameText = (lastName.text ?? "").trimmingCharacters(in: .whitespaces)
        let ageText = (age.text ?? "").trimmingCharacters(in: .whitespaces)
        
        if !firstNameText.isEmpty && !lastNameText.isEmpty && Int(ageText) != nil {
            addBtn.isEnabled = true
        } else {
            addBtn.isEnabled = false
        }
    }
    
//    override func willMove(toParentViewController parent: UIViewController?) {
//        super.willMove(toParentViewController: parent)
//        print("child will move ....")
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
