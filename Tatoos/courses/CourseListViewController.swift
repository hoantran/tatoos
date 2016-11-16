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

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if (DataManager.listCourses()[indexPath.row].students?.count)! > 0 {
            return indexPath
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (DataManager.listCourses()[indexPath.row].students?.count)! > 0 {
            self.performSegue(withIdentifier: "showEntrollment", sender: self)
        } else {
            log.error("There aren't any courses.")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManager.removeCourse(DataManager.listCourses()[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEntrollment" {
            navigationItem.backBarButtonItem?.title = "Done"
            let upcoming = segue.destination as! EnrollmentViewController
            let indexPath =  self.courseTable.indexPathForSelectedRow
            
            upcoming.course = DataManager.listCourses()[(indexPath?.row)!]
            self.courseTable.deselectRow(at: indexPath!, animated: true)
        } else {
            navigationItem.backBarButtonItem?.title = "Cancel"
        }
    }
}
