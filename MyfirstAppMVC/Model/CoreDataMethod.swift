//
//  CoreDataFoundation.swift
//  MyfirstAppMVC
//
//  Created by Admin iMBC on 11/23/23.
//

import Foundation
import CoreData
import UIKit

class CoreDataMethod{
    var people: [NSManagedObject] = []
    let defaults = UserDefaults.standard
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init() {
        
    }
    
    func saveRegister(email:String, id: String, password:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Info", in: managedContext)!
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(email, forKey: "email")
        person.setValue(password, forKey: "password")
        person.setValue(id, forKey: "id")
        do{
            try managedContext.save()
            people.append(person)
        } catch let error as NSError{
            print("could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func fetchItems(){
        guard let appDelegate:AppDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Info")
        //let predicate = NSPredicate(format: "board == %@", "순대")
        //fetchRequest.predicate = predicate
        do{
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    func fetchItemsDiary(uemail:String) -> [NSManagedObject]{
        guard let appDelegate:AppDelegate = UIApplication.shared.delegate as? AppDelegate else{return people}
        let managedContext:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Diary")
        if uemail == ""{
            return people
        }
        let predicate = NSPredicate(format: "email == %@", uemail)
        fetchRequest.predicate = predicate
        do{
            people = try managedContext.fetch(fetchRequest)
            people.reverse()
            return people
        } catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return people
    }
    
}
