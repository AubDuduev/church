//
//  URLBody.swift
//  DgBetTrip
//
//  Created by Senior Developer on 01.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLBody {
  
  enum BodyType {
    
    case Registration
    case DeviceData
    case AppMetricaID
    case AppID
    case AppMetricaPushToken
    case WebID
    case UserData(ENCUserData)
    case Order(ENCOrder)
    case Transaction(ENCTransaction)
  }
  
  public func createEncoding(type: BodyType?) -> Data? {
    guard let type = type else { return nil }
    switch type {
      case .Registration:
        let data = try? JSONEncoder().encode(ENCRegistration())
        return data
      case .DeviceData:
        let data = try? JSONEncoder().encode(ENCDeviceData())
        return data
      case .AppMetricaID:
        let data = try? JSONEncoder().encode(ENCAppMetricaID())
        return data
      case .AppID:
        let data = try? JSONEncoder().encode(ENCAppID())
        return data
      case .AppMetricaPushToken:
        let data = try? JSONEncoder().encode(ENCAppMetricaPushToken())
        return data
      case .WebID:
        let data = try? JSONEncoder().encode(ENCWebID())
        return data
      case .UserData(let userData):
        let data = try? JSONEncoder().encode(userData)
        return data
      case .Order(let order):
        let data = try? JSONEncoder().encode(order)
        return data
      case .Transaction(let transaction):
        let data = try? JSONEncoder().encode(transaction)
        return data
    }
  }
}

