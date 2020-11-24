//
//  URLString.swift
//  DgBetTrip
//
//  Created by Senior Developer on 19.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import Foundation

class URLString {
  
  public var api: String {
    get {
      return GVuserData.apiURLNotLastSlash ?? "not apiURLNotLastSlash"
    }
  }
  enum Url: String {
    
    case non
    case urlProdaction
    case urlDeveloper
    case hramInstagramm = "https://instagram.com/hram_podkopai?igshid=1gm2wnraxm1rf"
    case hramSite       = "http://www.hram-podkopai.ru/"
  }

  enum HTML: String {
    
    case non
   
  }
}
