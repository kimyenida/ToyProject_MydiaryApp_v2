//
//  Info+CoreDataProperties.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/23/23.
//
//

import Foundation
import CoreData


extension Info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Info> {
        return NSFetchRequest<Info>(entityName: "Info")
    }

    @NSManaged public var password: String?
    @NSManaged public var id: String?
    @NSManaged public var email: String?

}

extension Info : Identifiable {

}
