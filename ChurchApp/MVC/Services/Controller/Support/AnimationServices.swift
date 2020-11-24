//
//  AnimationServices.swift
//  ChurchApp

import Foundation

class AnimationServices: Controller {
  
  //MARK: - Public variable
  public var VC: ServicesViewController!
  
  
}
//MARK: - Initial
extension AnimationServices{
  
  //MARK: - Inition
  convenience init(viewController: ServicesViewController) {
    self.init()
    self.VC = viewController
  }
}

