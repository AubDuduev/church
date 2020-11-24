//
//  AnimationRegistration.swift
//  ChurchApp

import Foundation

class AnimationRegistration: Controller {
  
  //MARK: - Public variable
  public var VC: RegistrationViewController!
  
  
}
//MARK: - Initial
extension AnimationRegistration{
  
  //MARK: - Inition
  convenience init(viewController: RegistrationViewController) {
    self.init()
    self.VC = viewController
  }
}

