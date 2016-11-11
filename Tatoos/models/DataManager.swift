//
//  DataManager.swift
//  Tatoos
//
//  Created by Hoan Tran on 11/10/16.
//  Copyright © 2016 Pego Consulting. All rights reserved.
//

import CoreData

class DataManager {
    static let studentClassName:String = String(describing: Student.self)
    static let courseClassName:String = String(describing: Course.self)
    
    private init() {}
    
    // MARK: - Student
    
    class func addStudent(_ firstName: String, _ lastName: String, _ age: Int)->Student {
        let uuid = NSUUID().uuidString
        
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: studentClassName, into: CoreDataStack.getContext()) as! Student
        student.id = uuid
        student.firstName = firstName
        student.lastName = lastName
        student.age = Int16(age)

        CoreDataStack.saveContext()

        return student
    }
    
    class func removeStudent(_ student: Student) {
        CoreDataStack.getContext().delete(student)
        CoreDataStack.saveContext()
    }
    
    class func dropAllCourses(_ student: Student) {
        let courses = student.courses
        for course in courses! {
            student.removeFromCourses((course as! Course))
        }
    }
    
    class func enroll(_ student: Student, courses: [Course])->Void {
        self.dropAllCourses(student)
        for course in courses {
            student.addToCourses(course)
        }
        CoreDataStack.saveContext()
    }
    

    class func listStudents()->[Student] {
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            let searchResults = try CoreDataStack.getContext().fetch(fetchRequest)
            log.debug("student count: \(searchResults.count)")

            for result in searchResults as [Student] {
                log.debug ("\(result.firstName!) \(result.lastName!) is \(result.age) years old")
            }
            
            return searchResults as [Student]
        } catch {
            log.severe("\(error)")
            return [Student]()
        }
    }

    
    
    
    
    // MARK: - Course
    
    class func addCourse(_ name: String)->Course{
        let uuid = NSUUID().uuidString
        let course:Course = NSEntityDescription.insertNewObject(forEntityName: courseClassName, into: CoreDataStack.getContext()) as! Course
        course.id = uuid
        course.name = name
        CoreDataStack.saveContext()
        
        return course
    }
    
    class func removeCourse(_ course: Course) {
        CoreDataStack.getContext().delete(course)
        CoreDataStack.saveContext()
    }

    
    class func listCourses()->[Course] {
        let fetchRequest:NSFetchRequest<Course> = Course.fetchRequest()
        
        do {
            let searchResults = try CoreDataStack.getContext().fetch(fetchRequest)
            log.debug("course count: \(searchResults.count)")
            
            for result in searchResults as [Course] {
                log.debug ("\(result.name)")
            }
            
            return searchResults as [Course]
        } catch {
            log.severe("\(error)")
            return [Course]()
        }
    }
}
