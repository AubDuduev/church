//
//  BibleControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class BibleControllers: Controllers {
  
  let setup    : SetupBible!
  let server   : ServerBible!
  let present  : PresentBible!
  let logic    : LogicBible!
  let animation: AnimationBible!
  let router   : RouterBible!
  let vc       : BibleViewController!
  
  init(viewController: BibleViewController) {
    
    self.setup     = SetupBible(viewController: viewController)
    self.server    = ServerBible(viewController: viewController)
    self.present   = PresentBible(viewController: viewController)
    self.logic     = LogicBible(viewController: viewController)
    self.animation = AnimationBible(viewController: viewController)
    self.router    = RouterBible(viewController: viewController)
    self.vc        = viewController
  }
}
