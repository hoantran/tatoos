//
//  EnrollmentViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/15/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class EnrollmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var course: Course?
    @IBOutlet weak var enrollmentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enrollmentTable.dataSource = self
        self.enrollmentTable.delegate = self
        navigationItem.title = "\((course?.name)!) Enrollment"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.course?.students?.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "enrollmentCell", for: indexPath)
        
//        let student: Student = self.course?.students [indexPath.row] as! Student
        let mySet = self.course?.students?.allObjects as! [Student]
        if mySet.count > indexPath.row {
            let student = mySet[indexPath.row]
            cell.textLabel?.text = "\(student.firstName!) \(student.lastName!)"
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK: - Navigation

}
