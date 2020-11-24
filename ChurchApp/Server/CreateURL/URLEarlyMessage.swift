//
//  URLEarlyMessage.swift
//  DgBetTrip
//
//  Created by Developer on 30.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLEarlyMessage: URLCreatoble {
  
  let urlPath    = URLPath()
  let urls       = URLs()
  let parameters = URLParameters()
  let customURL  = URLCustom()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .earlyMessage(let changePath, time: let time):
        let host      = self.urlPath.create(change: changePath)
        let urlString = [self.urls.string.api, host, "?created_at_less_than=\(time)"].joined()
        return (urlString, URL(string: urlString))
      default:
         return nil
    }
  }
}
