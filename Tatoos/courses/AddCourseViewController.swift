//
//  AddCourseViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/15/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class AddCourseViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBAction func addBtnTapped(_ sender: Any) {
        if let nv = self.navigationController {
            _ = DataManager.addCourse(self.name.text!)
            nv.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.isEnabled = false
        name.addTarget(self, action:#selector(fieldChange), for: UIControlEvents.editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fieldChange(textField: UITextField) {
        let nameText = (name.text ?? "").trimmingCharacters(in: .whitespaces)
        
        if !nameText.isEmpty {
            addBtn.isEnabled = true
        } else {
            addBtn.isEnabled = false
        }
    }

    // MARK: - Navigation

}
