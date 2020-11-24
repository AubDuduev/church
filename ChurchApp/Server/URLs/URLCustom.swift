//
//  URLString.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLCustom {
  
  let urlPath = URLPath()
  let urlHost = URLHost()
  
  enum Scheme: String {
    case http
    case https
    case ws
    case wss
  }
  struct Custom {
    
    let path      : URLPath.Path
    let scheme    : Scheme
    let host      : URLHost.Types
    let changePath: URLPath.ChangePath
    let queryItems: [URLQueryItem]?
    
    init(scheme: Scheme = .https, host: URLHost.Types = .non, path: URLPath.Path = .non, changePath: URLPath.ChangePath = .non, queryItems: [URLQueryItem]? = nil) {
      
      self.path       = path
      self.scheme     = scheme
      self.host       = host
      self.changePath = changePath
      self.queryItems = queryItems
    }
  }
  public func create(type: Custom) -> ReturnURL {
    var components = URLComponents()
    components.scheme     = type.scheme.rawValue
    components.host       = self.urlHost.create(type.host)
    components.path       = type.path.rawValue + self.urlPath.create(change: type.changePath)
    components.queryItems = type.queryItems
    return (components.url?.absoluteString, components.url)
  }
}
