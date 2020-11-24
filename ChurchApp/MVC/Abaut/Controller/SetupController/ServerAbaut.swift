//
//  ServerAbaut.swift
//  ChurchApp

import Foundation

class ServerAbaut: Controller {
  
  //MARK: - Public variable
  public var VC: AbautViewController!
  
  
}
//MARK: - Initial
extension ServerAbaut{
  
  //MARK: - Inition
  convenience init(viewController: AbautViewController) {
    self.init()
    self.VC = viewController
  }
}

