//
//  EnrollCourseViewController.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/14/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import UIKit

class EnrollCourseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.backItem?.title = "Cancel"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "enrollCell", for: indexPath)
        cell.textLabel?.text = "Walk 101"
        return cell
    }
    
    
}
