//
//  URLUserData.swift
//  DgBetTrip
//
//  Created by Senior Developer on 10.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLUserData: URLCreatoble {
  
  var urlPath = URLPath()
  var urls    = URLs()
    
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .userData( let path, let changePath):
        let stringURL = [self.urls.string.api, path.rawValue, urlPath.create(change: changePath)].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
        return nil
    }
  }
}
