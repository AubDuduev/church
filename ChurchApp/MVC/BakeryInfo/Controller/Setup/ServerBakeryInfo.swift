//
//  ServerBakeryInfo.swift
//  ChurchApp

import Foundation

class ServerBakeryInfo: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryInfoViewController!
  
  
}
//MARK: - Initial
extension ServerBakeryInfo{
  
  //MARK: - Inition
  convenience init(viewController: BakeryInfoViewController) {
    self.init()
    self.VC = viewController
  }
}

