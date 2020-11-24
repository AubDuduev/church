//
//  Typealiases.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class RootVC {
  
  public func set(window: UIWindow?){
    let rootViewController = UIStoryboard.createVC(sbID: .Loading)
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
  }
}

