//
//  SetupStart.swift
//  ChurchApp

import Foundation

class SetupStart: Controller {
  
  //MARK: - Public variable
  public var VC: StartViewController!
  
  
}
//MARK: - Initial
extension SetupStart{
  
  //MARK: - Inition
  convenience init(viewController: StartViewController) {
    self.init()
    self.VC = viewController
  }
}

