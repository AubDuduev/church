//
//  NewsControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class NewsControllers: Controllers {
  
  let setup    : SetupNews!
  let server   : ServerNews!
  let present  : PresentNews!
  let logic    : LogicNews!
  let animation: AnimationNews!
  let router   : RouterNews!
  let vc       : NewsViewController!
  let tbvc     : MainTabBarViewController!
  
  init(viewController: NewsViewController) {
    
    self.setup     = SetupNews(viewController: viewController)
    self.server    = ServerNews(viewController: viewController)
    self.present   = PresentNews(viewController: viewController)
    self.logic     = LogicNews(viewController: viewController)
    self.animation = AnimationNews(viewController: viewController)
    self.router    = RouterNews(viewController: viewController)
    self.vc        = viewController
    self.tbvc      = viewController.tabBarController as? MainTabBarViewController
  }
}
