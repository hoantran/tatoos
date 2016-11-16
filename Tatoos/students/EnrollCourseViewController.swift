//
//  EnrollCourseViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/14/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class EnrollCourseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var student: Student?
    var selected: [Bool]?
    var catalog: [Course]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selected = nil
        self.catalog = DataManager.listCourses()
        if (self.catalog?.count)! > 0 {
            let enrollments = self.student?.courses
            self.selected = [Bool](repeating: false, count: (self.catalog?.count)!)
            for index in stride(from: 0, to: (self.catalog?.count)!, by: 1) {
                if isEnrolled((self.catalog?[index])!, enrollments!) {
                    self.selected?[index] = true
                }
            }
        }
    }
    
    private func isEnrolled(_ course: Course, _ set: NSSet)->Bool {
        for i in set {
            if (i as! Course).id == course.id {
                return true
            }
        }
        return false
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        if parent == nil {
            var newSet = [Course]()
            for index in stride(from: 0, to: (self.selected?.count)!, by: 1) {
                if (self.selected?[index])! {
                    newSet.append((self.catalog?[index])!)
                }
            }
            DataManager.enroll(self.student!, courses: newSet)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.listCourses().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "enrollCell", for: indexPath)
        
        cell.accessoryType = (self.selected?[indexPath.row])! ? .checkmark : .none
        cell.textLabel?.text = self.catalog?[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.selected?[indexPath.row])! {
            self.selected?[indexPath.row] = false
        } else {
            self.selected?[indexPath.row] = true
        }
        tableView.reloadData()
    }
}
