//
//  CoreDataManager.swift
//  ZalandoFastSearchSwift
//
//  Created by Alexander Stolar on 11/07/2018.
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import CoreData
import class UIKit.UIApplication

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() { }
    
    func fetchUsers() -> [UserCredentials]? {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
            let response: [NSManagedObject] = try managedContext.fetch(fetchRequest)
            return response
                .filter { $0.value(forKey: "login") != nil && $0.value(forKey: "password") != nil }
                .map { UserCredentials(login: $0.value(forKey: "login") as! String, password: $0.value(forKey: "password") as! String) }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func checkUser(with userCredentials: UserCredentials) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "login = %@", userCredentials.login), NSPredicate(format: "password = %@", userCredentials.password)])
        fetch.predicate = compoundPredicate
        
        do {
            return try !context.fetch(fetch).isEmpty
        } catch {
            return false
        }
    }
    
    func saveUser(with userCredentials: UserCredentials) -> Bool {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(userCredentials.login, forKeyPath: "login")
        user.setValue(userCredentials.password, forKeyPath: "password")
        
        do {
            try managedContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
}
