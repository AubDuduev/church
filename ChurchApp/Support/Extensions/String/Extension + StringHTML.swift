//
//  Extension + StringHTML.swift
//  ChurchApp
//
//  Created by Senior Developer on 10.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

extension String {
  var htmlToAttributedString: NSAttributedString? {
    guard let data = self.data(using: .utf8) else { return nil }
    do {
      return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
    } catch {
      return nil
    }
  }
  var htmlToString: String {
    return htmlToAttributedString?.string ?? ""
  }
}
