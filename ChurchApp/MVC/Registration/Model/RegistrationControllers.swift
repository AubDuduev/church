//
//  RegistrationControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class RegistrationControllers: Controllers {
  
  let setup    : SetupRegistration!
  let server   : ServerRegistration!
  let present  : PresentRegistration!
  let logic    : LogicRegistration!
  let animation: AnimationRegistration!
  let router   : RouterRegistration!
  let vc       : RegistrationViewController!
  
  init(viewController: RegistrationViewController) {
    
    self.setup     = SetupRegistration(viewController: viewController)
    self.server    = ServerRegistration(viewController: viewController)
    self.present   = PresentRegistration(viewController: viewController)
    self.logic     = LogicRegistration(viewController: viewController)
    self.animation = AnimationRegistration(viewController: viewController)
    self.router    = RouterRegistration(viewController: viewController)
    self.vc        = viewController
  }
}
