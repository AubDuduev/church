//
//  NoteControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class NoteControllers: Controllers {
  
  let setup    : SetupNote!
  let server   : ServerNote!
  let present  : PresentNote!
  let logic    : LogicNote!
  let animation: AnimationNote!
  let router   : RouterNote!
  let vc       : NoteViewController!
  
  init(viewController: NoteViewController) {
    
    self.setup     = SetupNote(viewController: viewController)
    self.server    = ServerNote(viewController: viewController)
    self.present   = PresentNote(viewController: viewController)
    self.logic     = LogicNote(viewController: viewController)
    self.animation = AnimationNote(viewController: viewController)
    self.router    = RouterNote(viewController: viewController)
    self.vc        = viewController
  }
}
