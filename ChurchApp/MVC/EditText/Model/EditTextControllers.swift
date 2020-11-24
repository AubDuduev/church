//
//  EditTextControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 10.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class EditTextControllers: Controllers {
  
  let setup    : SetupEditText!
  let server   : ServerEditText!
  let present  : PresentEditText!
  let logic    : LogicEditText!
  let animation: AnimationEditText!
  let router   : RouterEditText!
  let vc       : EditTextViewController!
  
  init(viewController: EditTextViewController) {
    
    self.setup     = SetupEditText(viewController: viewController)
    self.server    = ServerEditText(viewController: viewController)
    self.present   = PresentEditText(viewController: viewController)
    self.logic     = LogicEditText(viewController: viewController)
    self.animation = AnimationEditText(viewController: viewController)
    self.router    = RouterEditText(viewController: viewController)
    self.vc        = viewController
  }
}
