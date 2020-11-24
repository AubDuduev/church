//
//  StreamControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class StreamControllers: Controllers {
  
  let setup    : SetupStream!
  let server   : ServerStream!
  let present  : PresentStream!
  let logic    : LogicStream!
  let animation: AnimationStream!
  let router   : RouterStream!
  let vc       : StreamViewController!
  
  init(viewController: StreamViewController) {
    
    self.setup     = SetupStream(viewController: viewController)
    self.server    = ServerStream(viewController: viewController)
    self.present   = PresentStream(viewController: viewController)
    self.logic     = LogicStream(viewController: viewController)
    self.animation = AnimationStream(viewController: viewController)
    self.router    = RouterStream(viewController: viewController)
    self.vc        = viewController
  }
}
