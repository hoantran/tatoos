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
    static let courseClassName:String = String(describing: Student.self)
    
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
        
        
//        let course:Course = NSEntityDescription.insertNewObject(forEntityName: courseClassName, into: CoreDataStack.getContext()) as! Course
//        course.name = "Quantum Physics 402"
//        
//        student.addToCourses(course)
//        
//        CoreDataStack.saveContext()
//        
//        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
//        
//        do {
//            let searchResults = try CoreDataStack.getContext().fetch(fetchRequest)
//            
//            print("student count: \(searchResults.count)")
//            
//            for result in searchResults as [Student] {
//                print ("\(result.firstName!) \(result.lastName!) is \(result.age) years old")
//            }
//        } catch {
//            print ("\(error)")
//        }
        
    }
    
    class func removeStudent(_ student: Student) {
        CoreDataStack.getContext().delete(student)
    }
    
    class func dropAllCourses(_ student: Student) {
        let courses = student.courses
        for course in courses! {
            student.removeFromCourses((course as! Course))
        }
//        for course: Course in courses! {
//            student.removeFromCourses(course)
//        }
    }
    
    class func enroll(_ student: Student, courses: [Course])->Void {
        for course in courses {
            student.addToCourses(course)
        }
        CoreDataStack.saveContext()
    }
    

    class func listStudents()->[Student] {
        
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            let searchResults = try CoreDataStack.getContext().fetch(fetchRequest)
            print("student count: \(searchResults.count)")

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
    
//    class func addCourse(_ name: String)->Course{
//        let uuid = NSUUID().uuidString
//        let course:Course = NSEntityDescription.insertNewObject(forEntityName: courseClassName, into: CoreDataStack.getContext()) as! Course
//        course.id = uuid
//        CoreDataStack.saveContext()
//        
//        return course
//    }
//    
//    class func getCourses()->[Course] {
//    }
//    
//    class func getEnrollments(_ course)->[Student] {
//    }
}
