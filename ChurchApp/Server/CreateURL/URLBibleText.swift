//
//  URLBibleText.swift
//  ChurchApp
//
//  Created by Senior Developer on 05.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Foundation

class URLBibleText: URLCreatoble {
  
  private var urlPath = URLPath()
  private var urls    = URLs()
  
  public func url(_ type: URLType.Types) -> ReturnURL? {
    
    switch type {
      case .bibleText(let bible, let book, let changePath):
        let changePath = self.urlPath.create(change: changePath)
        let stringURL  = [self.urls.string.api, bible.rawValue, book.rawValue, changePath].joined(separator: "/")
        let url        = URL(string: stringURL)
        return (stringURL, url)
      default:
         return nil
    }
  }
}
