//
//  ViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/10/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = DataManager.listStudents()
        CoreDataStack.deleteAllData()
        
        _ = DataManager.addStudent("A", "Team", 12)

        _ = DataManager.listStudents()
        CoreDataStack.deleteAllData()

        _ = DataManager.listStudents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

