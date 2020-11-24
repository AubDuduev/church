//
//  OrdersControllers.swift
//  ChurchApp
//
//  Created by Senior Developer on 28.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class OrdersControllers: Controllers {
  
  let setup    : SetupOrders!
  let server   : ServerOrders!
  let present  : PresentOrders!
  let logic    : LogicOrders!
  let animation: AnimationOrders!
  let router   : RouterOrders!
  let vc       : OrdersViewController!
  
  init(viewController: OrdersViewController) {
    
    self.setup     = SetupOrders(viewController: viewController)
    self.server    = ServerOrders(viewController: viewController)
    self.present   = PresentOrders(viewController: viewController)
    self.logic     = LogicOrders(viewController: viewController)
    self.animation = AnimationOrders(viewController: viewController)
    self.router    = RouterOrders(viewController: viewController)
    self.vc        = viewController
  }
}
