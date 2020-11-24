//
//  URLGetPrays.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

class URLGetPrays: URLCreatoble {
  
  private var urlPath = URLPath()
  private var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .getPrays(let prays):
        let stringURL = [self.urls.string.api, prays.rawValue].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
         return nil
    }
  }
}
