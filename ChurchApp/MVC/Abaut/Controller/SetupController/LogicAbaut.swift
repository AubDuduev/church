//
//  LogicAbaut.swift
//  ChurchApp

import Foundation

class LogicAbaut: Controller {
  
  //MARK: - Public variable
  public var VC: AbautViewController!
  
  public func setIndexPageControll(indexPath: IndexPath){
    self.VC.pageControll.currentPage = (indexPath.row)
  }
}
//MARK: - Initial
extension LogicAbaut{
  
  //MARK: - Inition
  convenience init(viewController: AbautViewController) {
    self.init()
    self.VC = viewController
  }
}

