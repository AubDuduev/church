//
//  LogicOrders.swift
//  ChurchApp

import Foundation

class LogicOrders: Controller {
  
  //MARK: - Public variable
  public var VC: OrdersViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
  
}
//MARK: - Private functions
extension LogicOrders {
  
  private func commonLogic(){
    //1 - Получаем все заказы
    self.VC.controllers.server.getOrders { (orders) in
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerOrders.check(orders: orders) else { return }
      //3 - Презентуем данные на контроллере
      self.VC.controllers.present.ordersTable(orders: orders!)
    }
      
  }
}
//MARK: - Initial
extension LogicOrders{
  
  //MARK: - Inition
  convenience init(viewController: OrdersViewController) {
    self.init()
    self.VC = viewController
  }
}

