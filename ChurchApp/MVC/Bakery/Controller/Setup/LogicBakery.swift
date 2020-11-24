//
//  LogicBakery.swift
//  ChurchApp

import Foundation

class LogicBakery: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryViewController!
  
  public func viewDidLoad() {
    self.commonLogicGetProducts()
  }
  public func viewWillDisappear() {
    self.alertHide()
  }
}
//MARK: - Private functions
extension LogicBakery {
  
  private func commonLogicGetProducts(){
    //1 - Получаем список продуктов
    self.VC.controllers.server.getProducts { (products) in
      //2 Обрабатываем ошибки
      guard self.VC.errorHandlerProducts.check(products: products, controller: self.VC.controllers) else { return }
      //3 Предстваляем данные в солекцию
      self.VC.controllers.present.collectionData(products: products)
    }
  }
  private func alertHide(){
    AlertEK.hide()
  }
}
//MARK: - Initial
extension LogicBakery{
  
  //MARK: - Inition
  convenience init(viewController: BakeryViewController) {
    self.init()
    self.VC = viewController
  }
}


