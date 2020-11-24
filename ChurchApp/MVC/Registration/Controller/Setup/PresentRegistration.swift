//
//  PresentRegistration.swift
//  ChurchApp

import Foundation

class PresentRegistration: Controller {
  
  //MARK: - Public variable
  public var VC: RegistrationViewController!
  
  
}
//MARK: - Initial
extension PresentRegistration{
  
  //MARK: - Inition
  convenience init(viewController: RegistrationViewController) {
    self.init()
    self.VC = viewController
  }
}

