//
//  URLStart.swift
//  ChurchApp
//
//  Created by Senior Developer on 03.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

class URLStart: URLCreatoble {
  
  private var urlPath = URLPath()
  private var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .start(let start):
        let stringURL = [self.urls.string.api, start.rawValue].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
         return nil
    }
  }
}
