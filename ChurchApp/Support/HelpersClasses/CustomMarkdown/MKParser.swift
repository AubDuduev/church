//
//  MKParser.swift
//  DgBetTrip
//
//  Created by Senior Developer on 29.04.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

struct MKParser {
  
  let textMessage: String?
  let boldColor  : UIColor
  let italicColor: UIColor
  let textColor  : UIColor
  let textSize   : CGFloat 
  
  init(textMessage: String?, boldColor: UIColor = .black, italicColor: UIColor = .black, textColor: UIColor = .black, textSize: CGFloat = 16) {
    
    self.textMessage = textMessage
    self.boldColor   = boldColor
    self.italicColor = italicColor
    self.textColor   = textColor
    self.textSize    = textSize
  }
}

//fileprivate static let regex = "(\\s+|^)(\\*)(.+?)(\\2)"   - BOLD
//fileprivate static let regex = "^(#{1,%@})\\s*(.+)$"       - HEADER
//fileprivate static let regex = "(\\s+|^)(\\*|_)(.+?)(\\2)" - ITALIK
//fileprivate static let onlyLinkRegex = "\\(\\S+(?=\\))\\)" - LINK
//fileprivate static let regex = "\\[[^\\]]+\\]\\(\\S+(?=\\))\\)"
