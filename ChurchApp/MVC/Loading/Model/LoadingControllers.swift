//
//  LoadingControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class LoadingControllers: Controllers {
  
  let setup    : SetupLoading!
  let server   : ServerLoading!
  let present  : PresentLoading!
  let logic    : LogicLoading!
  let animation: AnimationLoading!
  let router   : RouterLoading!
  let vc       : LoadingViewController!
  
  init(viewController: LoadingViewController) {
    
    self.setup     = SetupLoading(viewController: viewController)
    self.server    = ServerLoading(viewController: viewController)
    self.present   = PresentLoading(viewController: viewController)
    self.logic     = LogicLoading(viewController: viewController)
    self.animation = AnimationLoading(viewController: viewController)
    self.router    = RouterLoading(viewController: viewController)
    self.vc        = viewController
  }
}
