//
//  ChatControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class ChatControllers: Controllers {
  
  let setup    : SetupChat!
  let server   : ServerChat!
  let present  : PresentChat!
  let logic    : LogicChat!
  let animation: AnimationChat!
  let router   : RouterChat!
  let vc       : ChatViewController!
  let tbvc     : MainTabBarViewController!
  
  init(viewController: ChatViewController) {
    
    self.setup     = SetupChat(viewController: viewController)
    self.server    = ServerChat(viewController: viewController)
    self.present   = PresentChat(viewController: viewController)
    self.logic     = LogicChat(viewController: viewController)
    self.animation = AnimationChat(viewController: viewController)
    self.router    = RouterChat(viewController: viewController)
    self.vc        = viewController
    self.tbvc      = viewController.tabBarController as? MainTabBarViewController
  }
}
