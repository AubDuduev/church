//
//  PersistenService.swift
//  DG.BET
//
//  Created by -=ALEKSANDR=- on 14/August/2019.
//  Copyright © 2019 -=ALEKSANDR=-. All rights reserved.
//
import Foundation
import CoreData

struct PersistentService {
  
  //1-Контекст в котором сохраняем данные
  static var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  //2- Контейнер в котром все храниться
  static var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "ChurchApp")
    container.loadPersistentStores(completionHandler: {(storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  //3- Сохронение в кнтейнер
  static func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  //4-
  private init(){}
}

