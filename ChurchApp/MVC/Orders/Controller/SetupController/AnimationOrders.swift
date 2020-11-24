//
//  AnimationOrders.swift
//  ChurchApp

import Foundation

class AnimationOrders: Controller {
  
  //MARK: - Public variable
  public var VC: OrdersViewController!
  
  
}
//MARK: - Initial
extension AnimationOrders{
  
  //MARK: - Inition
  convenience init(viewController: OrdersViewController) {
    self.init()
    self.VC = viewController
  }
}

