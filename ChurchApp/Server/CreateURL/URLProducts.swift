//
//  URLProducts.swift
//  ChurchApp
//
//  Created by Senior Developer on 01.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

class URLProducts: URLCreatoble {
  
  private var urlPath = URLPath()
  private var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .products(let products):
        let stringURL = [self.urls.string.api, products.rawValue].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
         return nil
    }
  }
}
