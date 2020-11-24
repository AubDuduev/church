//
//  RouterBakeryInfo.swift
//  ChurchApp
import Foundation

class RouterBakeryInfo: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryInfoViewController!
  
  
}
//MARK: - Initial
extension RouterBakeryInfo{
  
  //MARK: - Inition
  convenience init(viewController: BakeryInfoViewController) {
    self.init()
    self.VC = viewController
  }
}

