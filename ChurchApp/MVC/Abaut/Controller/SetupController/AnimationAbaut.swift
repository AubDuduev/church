//
//  AnimationAbaut.swift
//  ChurchApp

import Foundation

class AnimationAbaut: Controller {
  
  //MARK: - Public variable
  public var VC: AbautViewController!
  
  
}
//MARK: - Initial
extension AnimationAbaut{
  
  //MARK: - Inition
  convenience init(viewController: AbautViewController) {
    self.init()
    self.VC = viewController
  }
}

