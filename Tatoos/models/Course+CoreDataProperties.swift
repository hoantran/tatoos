//
//  Course+CoreDataProperties.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/10/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import Foundation
import CoreData

extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course");
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for students
extension Course {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}
