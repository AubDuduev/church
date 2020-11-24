//
//  AnimationBakery.swift
//  ChurchApp

import Foundation

class AnimationBakery: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryViewController!
  
  
}
//MARK: - Initial
extension AnimationBakery{
  
  //MARK: - Inition
  convenience init(viewController: BakeryViewController) {
    self.init()
    self.VC = viewController
  }
}

