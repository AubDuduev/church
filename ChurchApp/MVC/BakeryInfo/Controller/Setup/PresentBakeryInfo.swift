//
//  PresentBakeryInfo.swift
//  ChurchApp

import Foundation

class PresentBakeryInfo: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryInfoViewController!
  
  
}
//MARK: - Initial
extension PresentBakeryInfo{
  
  //MARK: - Inition
  convenience init(viewController: BakeryInfoViewController) {
    self.init()
    self.VC = viewController
  }
}

