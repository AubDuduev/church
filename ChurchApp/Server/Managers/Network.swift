//
//  NetworkCheck.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit
import Reachability

class Network {
  
  public func check() -> Bool {
    let reachability = try? Reachability()
    switch reachability?.connection {
      case .cellular:
        print("cellular")
        return true
      case .wifi:
        print("wifi")
        return true
      case .unavailable:
        AlertEK.dеfault(title: .error, message: .noNetwork)
        return false
      case .some(.none):
        AlertEK.dеfault(title: .error, message: .noNetwork)
        return false
      default:
        AlertEK.dеfault(title: .error, message: .noNetwork)
        return false
    }
  }

}


