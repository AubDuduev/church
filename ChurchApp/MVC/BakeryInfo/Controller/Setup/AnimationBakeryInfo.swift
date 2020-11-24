//
//  AnimationBakeryInfo.swift
//  ChurchApp

import Foundation

class AnimationBakeryInfo: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryInfoViewController!
  
  
}
//MARK: - Initial
extension AnimationBakeryInfo{
  
  //MARK: - Inition
  convenience init(viewController: BakeryInfoViewController) {
    self.init()
    self.VC = viewController
  }
}

