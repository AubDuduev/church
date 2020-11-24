//
//  URLPhotoUrl.swift
//  DgBetTrip
//
//  Created by Developer on 27.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLPhotoUrl: URLCreatoble {
  
  var urlPath = URLPath()
  var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .photoURL(let upload):
        let stringURL = [self.urls.string.api, upload.rawValue].joined(separator: "/")
        let url       = URL(string: stringURL)
        return (stringURL, url)
      default:
         return nil
    }
  }
}
