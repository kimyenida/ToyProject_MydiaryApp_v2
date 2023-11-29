//
//  Diary+CoreDataProperties.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/23/23.
//
//

import Foundation
import CoreData


extension Diary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary> {
        return NSFetchRequest<Diary>(entityName: "Diary")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: String?
    @NSManaged public var email: String?
    @NSManaged public var content: String?

}

extension Diary : Identifiable {

}
