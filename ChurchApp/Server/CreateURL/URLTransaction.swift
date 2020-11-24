//
//  URLTransaction.swift
//  DgBetTrip
//
//  Created by Senior Developer on 12.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLTransaction: URLCreatoble {
  
  var urlPath = URLPath()
  var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .transaction(let payments):
        let stringURL = [self.urls.string.api, payments.rawValue].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
        return nil
    }
  }
}
