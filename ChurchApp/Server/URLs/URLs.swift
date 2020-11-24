//
//  URLs.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLs {
  
  private let type   = URLType()
//  private let typeFB = URLTypeFB()
  private let api    = URLAPI()
  
  public let string = URLString()
  
 
  public func get(type: URLAPI.Types) -> ReturnURL {
    return self.api.get(type: type)
  }
  public func create(type: URLType.Types) -> ReturnURL? {
    return self.type.set(type).url(type)
  }
//  public func createFB(type: URLTypeFB.Types) -> ReturnURLFB? {
//    return self.typeFB.set(type).url(type)
//  }
}

