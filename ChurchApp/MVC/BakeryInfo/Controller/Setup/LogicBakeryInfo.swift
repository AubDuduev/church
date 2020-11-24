//
//  LogicBakeryInfo.swift
//  ChurchApp

import Foundation

class LogicBakeryInfo: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryInfoViewController!
  
  
}
//MARK: - Initial
extension LogicBakeryInfo{
  
  //MARK: - Inition
  convenience init(viewController: BakeryInfoViewController) {
    self.init()
    self.VC = viewController
  }
}

