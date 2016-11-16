//
//  CourseListViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/15/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class CourseListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var courseTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.courseTable.delegate = self
        self.courseTable.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        self.courseTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.listCourses().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath)
        
        let courses = DataManager.listCourses()
        
        if courses.count > indexPath.row {
            let course = courses[indexPath.row]
            cell.textLabel?.text = "\(course.name!)"
            
            if (course.students?.count)! > 0 {
                cell.accessoryType = .disclosureIndicator
            } else {
                cell.accessoryType = .none
            }
        }
        
        return cell
    }

    // MARK: - Navigation

}
