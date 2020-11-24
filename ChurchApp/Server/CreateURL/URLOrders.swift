//
//  URLOrders.swift
//  ChurchApp
//
//  Created by Senior Developer on 18.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

class URLOrders: URLCreatoble {
  
  private var urlPath = URLPath()
  private var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    switch type {
      case .orders(let orders):
        let stringURL = [self.urls.string.api, orders.rawValue].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
         return nil
    }
  }
}
