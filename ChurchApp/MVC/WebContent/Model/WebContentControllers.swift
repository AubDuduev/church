//
//  WebContentControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 20.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class WebContentControllers: Controllers {
  
  let setup    : SetupWebContent!
  let server   : ServerWebContent!
  let present  : PresentWebContent!
  let logic    : LogicWebContent!
  let animation: AnimationWebContent!
  let router   : RouterWebContent!
  let vc       : WebContentViewController!
  
  init(viewController: WebContentViewController) {
    
    self.setup     = SetupWebContent(viewController: viewController)
    self.server    = ServerWebContent(viewController: viewController)
    self.present   = PresentWebContent(viewController: viewController)
    self.logic     = LogicWebContent(viewController: viewController)
    self.animation = AnimationWebContent(viewController: viewController)
    self.router    = RouterWebContent(viewController: viewController)
    self.vc        = viewController
  }
}
