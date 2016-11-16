//
//  StudentListViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/14/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var studentTable: UITableView!
    @IBOutlet weak var backBtn: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        studentTable.delegate = self
        studentTable.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        print("--- viewDidAppear ---")
        self.studentTable.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.listStudents().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentCell
        let students = DataManager.listStudents()
        
        if students.count > indexPath.row {
            let student = students[indexPath.row]
            cell.textLabel?.text = "\(student.firstName!) \(student.lastName!)"
            
            if DataManager.listCourses().count > 0 {
                cell.accessoryType = .disclosureIndicator
            } else {
                cell.accessoryType = .none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if DataManager.listCourses().count > 0 {
            return indexPath
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if DataManager.listCourses().count > 0 {
            self.performSegue(withIdentifier: "showEnroll", sender: self)
        } else {
            log.error("There aren't any courses.")
        }
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManager.removeStudent(DataManager.listStudents()[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showEnroll" {
            navigationItem.backBarButtonItem?.title = "Done"
            let upcoming = segue.destination as! EnrollCourseViewController
            let indexPath = self.studentTable.indexPathForSelectedRow
            
            let students = DataManager.listStudents()
            if students.count > (indexPath?.row)! {
                upcoming.student = students[(indexPath?.row)!]
            } else {
                log.error("Can not find the student")
                upcoming.student = nil
            }
            self.studentTable.deselectRow(at: indexPath!, animated: true)
        } else {
            navigationItem.backBarButtonItem?.title = "Cancel"
        }
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        print("parent will move ....")
    }
}
