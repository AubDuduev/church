//
//  ServerRegistration.swift
//  ChurchApp

import Foundation

class ServerRegistration: Controller {
  
  //MARK: - Public variable
  public var VC: RegistrationViewController!
  
  
}
//MARK: - Initial
extension ServerRegistration{
  
  //MARK: - Inition
  convenience init(viewController: RegistrationViewController) {
    self.init()
    self.VC = viewController
  }
}

