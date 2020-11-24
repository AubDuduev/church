//
//  BibleTextControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class BibleTextControllers: Controllers {
  
  let setup    : SetupBibleText!
  let server   : ServerBibleText!
  let present  : PresentBibleText!
  let logic    : LogicBibleText!
  let animation: AnimationBibleText!
  let router   : RouterBibleText!
  let vc       : BibleTextViewController!
  
  init(viewController: BibleTextViewController) {
    
    self.setup     = SetupBibleText(viewController: viewController)
    self.server    = ServerBibleText(viewController: viewController)
    self.present   = PresentBibleText(viewController: viewController)
    self.logic     = LogicBibleText(viewController: viewController)
    self.animation = AnimationBibleText(viewController: viewController)
    self.router    = RouterBibleText(viewController: viewController)
    self.vc        = viewController
  }
}
