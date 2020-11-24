//
//  URLMessages.swift
//  DgBetTrip
//
//  Created by Senior Developer on 10.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLMessages: URLCreatoble {
  
  var urlPath = URLPath()
  var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .messages(let userPath, let changePath, let messagesPath):
        let stringURL = [self.urls.string.api, userPath.rawValue, urlPath.create(change: changePath), messagesPath.rawValue].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
        return nil
    }
  }
}
