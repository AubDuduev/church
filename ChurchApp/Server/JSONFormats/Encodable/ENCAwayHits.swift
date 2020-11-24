//
//  ENCAwayHits.swift
//  DgBetTrip
//
//  Created by Senior Developer on 02.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//

import Foundation

public struct ENCAwayHits: Encodable {
  
  let fullURL     : String?
  let requestedURL: String?
  let source      = URLWebView.Sources.BooksFragment.rawValue
  
  enum CodingKeys: String, CodingKey {
    
    case fullURL      = "full_url"
    case requestedURL = "requested_url"
    case source       = "source"
  }
}

