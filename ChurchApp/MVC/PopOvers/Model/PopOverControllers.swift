//
//  PopOverControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class PopOverControllers: Controllers {
  
  let setup    : SetupPopOver!
  let server   : ServerPopOver!
  let present  : PresentPopOver!
  let logic    : LogicPopOver!
  let animation: AnimationPopOver!
  let router   : RouterPopOver!
  let vc       : PopOverViewController!
  
  init(viewController: PopOverViewController) {
    
    self.setup     = SetupPopOver(viewController: viewController)
    self.server    = ServerPopOver(viewController: viewController)
    self.present   = PresentPopOver(viewController: viewController)
    self.logic     = LogicPopOver(viewController: viewController)
    self.animation = AnimationPopOver(viewController: viewController)
    self.router    = RouterPopOver(viewController: viewController)
    self.vc        = viewController
  }
}
