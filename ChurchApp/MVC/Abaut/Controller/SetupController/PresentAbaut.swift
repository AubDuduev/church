//
//  PresentAbaut.swift
//  ChurchApp

import Foundation

class PresentAbaut: Controller {
  
  //MARK: - Public variable
  public var VC: AbautViewController!
  
  
}
//MARK: - Initial
extension PresentAbaut{
  
  //MARK: - Inition
  convenience init(viewController: AbautViewController) {
    self.init()
    self.VC = viewController
  }
}

