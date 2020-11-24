//
//  ProfileControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 12.08.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class ProfileControllers: Controllers {
  
  let setup    : SetupProfile!
  let server   : ServerProfile!
  let present  : PresentProfile!
  let logic    : LogicProfile!
  let animation: AnimationProfile!
  let router   : RouterProfile!
  let vc       : ProfileViewController!
  
  init(viewController: ProfileViewController) {
    
    self.setup     = SetupProfile(viewController: viewController)
    self.server    = ServerProfile(viewController: viewController)
    self.present   = PresentProfile(viewController: viewController)
    self.logic     = LogicProfile(viewController: viewController)
    self.animation = AnimationProfile(viewController: viewController)
    self.router    = RouterProfile(viewController: viewController)
    self.vc        = viewController
  }
}
