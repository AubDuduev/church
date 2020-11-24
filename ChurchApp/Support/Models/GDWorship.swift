//
//  GDWorship.swift
//  ChurchApp
//
//  Created by Senior Developer on 19.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class GDWorship {
  
  let ID         : Int?
  let date       : Int?
  let event      : String?
  let program    : [DECProgram]?
  let createdAt  : String?
  let updatedAt  : String?
  let deletedAt  : String?
  let stream     : String?
  let streamInfo : DECStreamInfo?
  let worshipType: WorshipType!
  
  
  
  init(worship: DECWorship, worshipType: WorshipType) {
    
    self.ID          = worship.ID
    self.date        = worship.date
    self.event       = worship.event
    self.program     = worship.program
    self.createdAt   = worship.createdAt
    self.updatedAt   = worship.updatedAt
    self.deletedAt   = worship.deletedAt
    self.stream      = worship.stream
    self.streamInfo  = worship.streamInfo
    self.worshipType = worshipType
  }
}
