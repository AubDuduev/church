//
//  SetupOrders.swift
//  ChurchApp

import Foundation

class SetupOrders: Controller {
  
  //MARK: - Public variable
  public var VC: OrdersViewController!
  
  public func viewDidLoad() {
    self.ordersTable()
  }
}
//MARK: - Private functions
extension SetupOrders {
  
  private func ordersTable(){
    self.VC.ordersTable.controllers = self.VC.controllers
  }
}
//MARK: - Private functions
extension SetupOrders {
  
  public func corner(cell: OrdersTableCell){
    cell.commonView.cornerRadius(5, true)
  }
  
}
//MARK: - Initial
extension SetupOrders {
  
  //MARK: - Inition
  convenience init(viewController: OrdersViewController) {
    self.init()
    self.VC = viewController
  }
}

