//
//  RouterOrders.swift
//  ChurchApp
import Foundation

class RouterOrders: Controller {
  
  //MARK: - Public variable
  public var VC: OrdersViewController!
  
  
}
//MARK: - Initial
extension RouterOrders{
  
  //MARK: - Inition
  convenience init(viewController: OrdersViewController) {
    self.init()
    self.VC = viewController
  }
}

