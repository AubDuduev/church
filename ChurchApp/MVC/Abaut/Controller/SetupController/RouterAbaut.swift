//
//  RouterAbaut.swift
//  ChurchApp
import Foundation

class RouterAbaut: Controller {
  
  //MARK: - Public variable
  public var VC: AbautViewController!
  
  
}
//MARK: - Initial
extension RouterAbaut{
  
  //MARK: - Inition
  convenience init(viewController: AbautViewController) {
    self.init()
    self.VC = viewController
  }
}

