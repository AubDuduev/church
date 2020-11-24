//
//  URLString.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLAPI {
  
  enum Types {
    case api
    case webSocet
    case store(String?)
    case urlString(URLString.Url)
  }
  
  func get(type: Types) -> ReturnURL {
    switch type {
      case .api:
        let stringURL = ""
        let url       = URL(string: "")
        return (stringURL, url)
      case .webSocet:
        let stringURL = ""
        let url       = URL(string:"")
        return (stringURL, url)
      case .store(url: let url):
        guard let urlNotNil = url else { return ("", nil)}
        let stringURL = [(GVuserData.urlStore ?? ""), urlNotNil].joined()
        let url       = URL(string: stringURL)
        return (stringURL, url)
      case .urlString(let urlString):
        let stringURL = urlString.rawValue
        let url       = URL(string: urlString.rawValue)
        return (stringURL, url)
    }
  }
}
