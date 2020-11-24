//
//  URLServerUrls.swift
//  ChurchApp
//
//  Created by Senior Developer on 23.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

class URLServerUrls: URLCreatoble {
  
  private var urlPath   = URLPath()
  private var urls      = URLs()
  private var urlCustom = URLCustom()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .serverUrls:
        let stringURL = self.urlCustom.create(type: .init(scheme: .https, host: .Static(.hramPodCopai), changePath: .serverUrls)).string
        let url       = URL(string: stringURL ?? "")
        return (stringURL, url)
      default:
         return nil
    }
  }
}
