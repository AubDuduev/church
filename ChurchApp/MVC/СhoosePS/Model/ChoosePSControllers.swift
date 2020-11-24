//
//  ChoosePSControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 30.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class ChoosePSControllers: Controllers {
  
  let setup    : SetupChoosePS!
  let server   : ServerChoosePS!
  let present  : PresentChoosePS!
  let logic    : LogicChoosePS!
  let animation: AnimationChoosePS!
  let router   : RouterChoosePS!
  let vc       : ChoosePSViewController!
  
  init(viewController: ChoosePSViewController) {
    
    self.setup     = SetupChoosePS(viewController: viewController)
    self.server    = ServerChoosePS(viewController: viewController)
    self.present   = PresentChoosePS(viewController: viewController)
    self.logic     = LogicChoosePS(viewController: viewController)
    self.animation = AnimationChoosePS(viewController: viewController)
    self.router    = RouterChoosePS(viewController: viewController)
    self.vc        = viewController
  }
}
