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
//        self.navigationController?.navigationBar.backItem?.title = "Cancel"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentCell
        
        cell.textLabel?.text = "Norah Jones"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showEnroll", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showEnroll" {
            navigationItem.backBarButtonItem?.title = "Done"
//            let upcoming = segue.destination as! EnrollCourseViewController
            let indexPath = self.studentTable.indexPathForSelectedRow
//            upcoming.studentID = indexPath?.row
            self.studentTable.deselectRow(at: indexPath!, animated: true)
        } else {
            navigationItem.backBarButtonItem?.title = "Cancel"
        }
    }
}
