//
//  CoreData.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit
import CoreData

class CoreData {
  
  public func fetchName<T: NSManagedObject>(object: T, key: UserData.CoreDataKey, name: String, execute: @escaping ClousureAny){
    
    let featchRequest: NSFetchRequest = T.fetchRequest()
    featchRequest.predicate = NSPredicate(format: "%@==\(key.rawValue)", name)
    do {
      let result = try PersistentService.context.fetch(featchRequest).first
      execute(result)
    } catch let error {
      print(error.localizedDescription, "Ошибка получения по имени объекта из CoreData")
    }
  }
  public func fetch<T: NSManagedObject>(object: T.Type,execute: @escaping ClousureAny){
    do {
      let result = try PersistentService.context.fetch(T.fetchRequest())
      execute(result.first)
    } catch let error {
      print(error.localizedDescription, "Ошибка получения массив объектов данного типа из CoreData")
      execute(nil)
    }
  }
  public func fetchArray<T: NSManagedObject>(object: T,execute: @escaping ClousureAny){
    do {
      let result = try PersistentService.context.fetch(T.fetchRequest())
      execute(result)
    } catch let error {
      print(error.localizedDescription, "Ошибка получения массив объектов данного типа из CoreData")
    }
  }
  public func create<T: NSManagedObject>(object: T.Type) -> NSManagedObject {
    let object = T(context: PersistentService.context)
    PersistentService.saveContext()
  return object
  }
  public func delete(object: NSManagedObject?){
    guard let object = object else { return }
    PersistentService.context.delete(object)
    PersistentService.saveContext()
  }
  public func edit(){
    PersistentService.saveContext()
  }
  public func createUserData(completion: @escaping ClousureEmpty){
    //Get UserData
    self.fetch(object: UserData.self) { (userData) in
      if userData != nil {
        GVuserData = userData as? UserData
        completion()
      } else {
        //Create UserData
        GVuserData = (self.create(object: UserData.self) as! UserData)
        completion()
      }
    }
  PersistentService.saveContext()
  }
}
