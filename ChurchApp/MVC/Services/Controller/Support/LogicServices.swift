//
//  LogicServices.swift
//  ChurchApp

import Foundation

class LogicServices: Controller {
  
  //MARK: - Public variable
  public var VC: ServicesViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
}
//MARK: - Private functions
extension LogicServices {
  
  private func commonLogic(){
    //1 - Получаем список служб
    self.VC.controllers.server.getServices { (services) in
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerServices.check(services: services) else { return }
      //3 - Презенутуем данные на контроллере
      self.VC.controllers.present.tableData(services: services)
      
    }
    //1 - Получаем цены
    self.VC.controllers.server.getPrice { (price) in
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerPrice.check(price: price) else { return }
      //3 - Презенутуем данные на контроллере
      GVPrice = price
      self.VC.prices = price
    }
  }
}
//MARK: - Initial
extension LogicServices{
  
  //MARK: - Inition
  convenience init(viewController: ServicesViewController) {
    self.init()
    self.VC = viewController
  }
}

