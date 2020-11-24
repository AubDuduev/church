//
//  PayNoteControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 16.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
//8129455419
import Foundation

class PayNoteControllers: Controllers {
  
  let setup    : SetupPayNote!
  let server   : ServerPayNote!
  let present  : PresentPayNote!
  let logic    : LogicPayNote!
  let animation: AnimationPayNote!
  let router   : RouterPayNote!
  let vc       : PayNoteViewController!
  
  init(viewController: PayNoteViewController) {
    
    self.setup     = SetupPayNote(viewController: viewController)
    self.server    = ServerPayNote(viewController: viewController)
    self.present   = PresentPayNote(viewController: viewController)
    self.logic     = LogicPayNote(viewController: viewController)
    self.animation = AnimationPayNote(viewController: viewController)
    self.router    = RouterPayNote(viewController: viewController)
    self.vc        = viewController
  }
}
